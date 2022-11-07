# DOCKER-GO-CI-CD

docker-go-cdi-cd é um repositório aonde estou implementando pela primeira vez pipelines de testes, CI, CD, testes de vulnerabilidade, qualidade de código e afins... para uma simples API :smile:

---

### Compilando todos os executáveis
Para compilar todos os executáveis, basta rodar:

```bash
$ make build
```

### Executando a API
Para executar a API, basta rodar:
```bash
$  make run-local
```

## Como testar

### Executando todos os testes
Então, rode todos os testes com:

```bash
$ make test
```

### Verificando coverage:
Para verificar o coverage, execute:

```bash
$ make cover
```

### Verificando report de testes:

Para entender o coverage dos testes, execute:

```bash
$ make report/unit
# $ make report/integration
```

esse comando irá gerar dois arquivos .html que mostram um report da coverage,
para abri-los, execute:

```bash
$ open .cover/unit.html
# $ open .cover/integration.html
```

---

