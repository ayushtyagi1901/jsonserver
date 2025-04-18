package main

import (
	"obsidian/routes"

	"github.com/gin-gonic/gin"
)

func main() {
	// Create a new Gin router
	router := gin.Default()

	// Set up routes
	routes.SetupRoutes(router)

	// Start the server on port 7500
	router.Run(":7500")
}
