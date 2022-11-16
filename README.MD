# DOCKER-GO-CI-CD

docker-go-cdi-cd é um repositório aonde estou implementando pela primeira vez pipelines de testes, CI, CD, testes de vulnerabilidade, qualidade de código e afins... para uma simples API :smile:

Work-flows list:
- Unit Tests and quality
  - Running tests :white_check_mark:
  - Check Gofmt :white_check_mark:
  - Make coverage file :white_check_mark:
  - Publish code coverage :white_check_mark:
- CI [WIP]
  - Build image push to Docker hub
  - ...[WIP]
- CD [WIP]
- Vulnerabilities scan [BACKLOG]

---

### Executando a API
Para executar a API, basta rodar:
```bash
$  make run/local 
```
### Compilando todos os executáveis
Para compilar todos os executáveis, basta rodar:

```bash
$ make build
```

## Como testar

### Executando todos os testes
Então, rode todos os testes com:

```bash
$ make run/local-test
```
### Verificando report de testes:

Para entender o coverage dos testes, execute:

```bash
$ make run/ci-test coverage
```

esse comando irá rodar todos os tests da aplicação e criar uma pasta `.cover` aonde lá teremos nosso coverage report:

para abri-los, execute:

```bash
$ make coverage/html
```

---

