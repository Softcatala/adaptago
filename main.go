package main

import (
	"github.com/gin-gonic/gin"
	"github.com/softcatala/adaptago/adapter"
	"net/http"
)

type incoming struct {
	original string `json:"original" binding:"required"`
}

func main() {

	adaptgo, _ := adapter.New("")

	r := gin.Default()

	r.SetTrustedProxies(nil)

	r.GET("/string", func(c *gin.Context) {

		sed := c.Query("sed")
		i := c.Query("input")

		adaptgo, err := adapter.New(sed)

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

		result, err := adaptgo.Adapt(i.original)
		if err != nil {
			c.JSON(http.StatusOK, gin.H{"original": result.Original, "adapted": result.Adapted})
		} else {
			c.JSON(http.StatusInternalServerError, gin.H{"original": result.Original, "error": err})
		}

		c.String(200, "welcome!")
	})

	r.Run(":8080")
}
