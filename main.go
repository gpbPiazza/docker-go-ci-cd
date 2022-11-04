package main

import (
	"github.com/gofiber/fiber/v2"
	"github.com/gpbPiazza/src/services/health_check"
)

func main() {
	app := fiber.New()

	app.Get("/", func(c *fiber.Ctx) error {
		return c.SendString("Hello, World!")
	})

	app.Get("/ping", func(c *fiber.Ctx) error {
		return c.SendString(health_check.NewService().Ping())
	})

	app.Listen(":5050")
}
