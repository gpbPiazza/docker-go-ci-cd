package main

import (
	"math/rand"
	"net/http"
	"time"

	"github.com/gpbPiazza/docker-go-ci-cd/src/services/calculator"

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

	app.Get("/random-sum", func(c *fiber.Ctx) error {
		randomNumbers := makeRandomNumbers()
		result := calculator.NewService().Sum(randomNumbers...)

		return c.Status(http.StatusOK).JSON(struct {
			RandomNumbers []int `json:"random_numbers"`
			Sum           int   `json:"sum"`
		}{
			RandomNumbers: randomNumbers,
			Sum:           result,
		})
	})

	app.Listen(":5050")
}

func makeRandomNumbers() []int {
	rand.Seed(time.Now().UnixNano())
	min := 0
	max := 150
	var result []int
	randomInterate := rand.Intn(max - min + 1)
	for i := 0; i < randomInterate; i++ {
		result = append(result, rand.Intn(max-min+1))
	}
	return result
}
