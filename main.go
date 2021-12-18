package main

import (
	"flag"
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/leonelquinteros/gotext"
	"github.com/softcatala/adaptago/adapter"
	"github.com/softcatala/adaptago/handlers"
	adapterpo "github.com/softcatala/adaptago/po"
	"net/http"
)

type incoming struct {
	Original string `json:"original" binding:"required"`
}

func main() {

	regexpFile := flag.String("file", "", "File with regular expressions")
	poFile := flag.String("po", "", "File with template PO file")

	flag.Parse()

	if *regexpFile == "" {
		panic("Missing regexp file argument")
	}

	if *poFile == "" {
		panic("Missing po file argument")
	}

	valencianitzador, err := adapter.NewValencianitzador(*regexpFile)

	if err != nil {
		panic(fmt.Sprintf("Could not load valencianitzador: %v", err))
	}

	poWrapper, err := adapterpo.NewWrapper(*poFile)

	r := gin.Default()

	r.SetTrustedProxies(nil)

	r.GET("/valencia", func(c *gin.Context) {

		t := c.Query("original")

		if t == "" {
			c.JSON(http.StatusBadRequest, gin.H{"message": "No text provided (original query param)"})
			return
		}

		o, err := poWrapper.Execute(t, valencianitzador.AdaptPo)

		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"original": t, "error": err})
			return
		}

		c.JSON(http.StatusOK, gin.H{"original": t, "adapted": o})
		return
	})

	r.POST("/valencia", func(c *gin.Context) {

		body, err := c.GetRawData()

		if err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"message": "Po content is invalid", "error": err})
			return
		}

		if string(body) == "" {
			c.JSON(http.StatusBadRequest, gin.H{"error": "Po content is empty"})
			return
		}

		po := gotext.NewPo()
		po.Parse(body)

		po, err = valencianitzador.AdaptPo(po)

		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err})
			return
		}

		out, err := po.MarshalText()

		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err})
			return
		}

		c.Data(http.StatusOK, gin.MIMEPlain, out)
		return
	})

	r.GET("/replace", handlers.ReplaceString)

	r.Run(":8080")
}
