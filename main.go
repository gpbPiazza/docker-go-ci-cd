package main

import (
	"github.com/gpbPiazza/docker-go-ci-cd/src/services/health_check"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/logger"
	"github.com/gofiber/fiber/v2/middleware/monitor"
)

func main() {
	app := fiber.New()

	app.Use(logger.New())

	app.Get("/metrics", monitor.New(monitor.Config{Title: "MyService Metrics Page"}))

	app.Get("/", func(c *fiber.Ctx) error {
		return c.SendString("Hello, World!")
	})

	app.Get("/ping", func(c *fiber.Ctx) error {
		return c.SendString(health_check.NewService().Ping())
	})

	app.Listen(":5050")
}
