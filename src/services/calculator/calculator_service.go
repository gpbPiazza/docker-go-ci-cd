package calculator

type CalculatorService struct {
}

func NewService() CalculatorService {
	return CalculatorService{}
}

func (this CalculatorService) Sum(numbers ...int) int {
	var result int

	for _, n := range numbers {
		result += n
	}

	return result
}
