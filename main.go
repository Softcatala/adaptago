package main

import (
	"flag"
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/softcatala/adaptago/adapter"
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

	fileAdapter, err := adapter.NewFile(*regexpFile, *poFile)

	if err != nil {
		panic(fmt.Sprintf("Could not load adapter: %v", err))
	}

	r := gin.Default()

	r.SetTrustedProxies(nil)

	r.GET("/string", func(c *gin.Context) {

		sed := c.Query("sed")
		i := c.Query("input")

		adaptgo, err := adapter.NewString(sed)

		var result *adapter.Result
		if err == nil || result == nil {
			result, err = adaptgo.Adapt(i)
		}

		if err == nil {
			c.JSON(http.StatusOK, gin.H{"original": result.Original, "adapted": result.Adapted})
		} else {
			c.JSON(http.StatusInternalServerError, gin.H{"original": result.Original, "error": err})
		}
	})

	r.POST("/po", func(c *gin.Context) {

		var i incoming
		c.BindJSON(&i)

		result, err := fileAdapter.Adapt(i.Original)
		if err == nil {
			c.JSON(http.StatusOK, gin.H{"original": result.Original, "adapted": result.Adapted})
		} else {
			c.JSON(http.StatusInternalServerError, gin.H{"original": result.Original, "error": err})
		}
	})

	r.Run(":8080")
}
