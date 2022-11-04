package calculator

import "testing"

func TestCalculator_Sum(t *testing.T) {

	testCases := []struct {
		name  string
		want  int
		input []int
	}{
		{
			name:  "1 + 1 should return 2",
			want:  2,
			input: []int{1, 1},
		},
		{
			name:  "5 + 5 + 1 should return 11",
			want:  11,
			input: []int{5, 5, 1},
		},
	}

	for _, tt := range testCases {
		t.Run(tt.name, func(t *testing.T) {
			service := NewService()

			if got := service.Sum(tt.input...); got != tt.want {
				t.Errorf("Sum() = %v, want %v", got, tt.want)
			}
		})
	}

}
