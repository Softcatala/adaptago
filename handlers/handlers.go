package handlers

import (
	"github.com/gin-gonic/gin"
	"github.com/softcatala/adaptago/adapter"
	"net/http"
)

func ReplaceString(c *gin.Context) {

	sed := c.Query("regexp")
	t := c.Query("original")

	if sed == "" {
		c.JSON(http.StatusBadRequest, gin.H{"message": "regexp is empty"})
		return
	}

	if t == "" {
		c.JSON(http.StatusBadRequest, gin.H{"message": "original text is empty"})
		return
	}

	a, err := adapter.NewRegexp(sed)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err})
		return
	}

	out, err := a.AdaptString(t)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err})
		return
	}

	c.JSON(http.StatusOK, gin.H{"original": t, "adapted": out})
	return
}
