package health_check

type HealthCheckService struct {
}

func NewService() HealthCheckService {
	return HealthCheckService{}
}

func (this HealthCheckService) Ping() string {
	return "Pong :)"
}
