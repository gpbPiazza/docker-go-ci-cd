package health_check

import (
	"testing"
)

func TestHealthCheckService_Pong(t *testing.T) {
	tests := []struct {
		name string
		want string
	}{
		{
			name: "should return Pong and a happy face)",
			want: "Pong :)",
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			this := &HealthCheckService{}
			if got := this.Ping(); got != tt.want {
				t.Errorf("Pong() = %v, want %v", got, tt.want)
			}
		})
	}
}
