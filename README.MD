# DOCKER-GO-CI-CD

docker-go-cdi-cd é um repositório aonde estou implementando pela primeira vez pipelines de testes, CI, CD, testes de vulnerabilidade, qualidade de código e afins... para uma simples API :smile:

Work-flows list:
- CI [DONE]
- Unit tests [WIP]
- CD [BACKLOG]
- Vulnerabilities scan [BACKLOG]
- Coverage range limit [BACKLOG]

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
$ make run/test
```
### Verificando report de testes:

Para entender o coverage dos testes, execute:

```bash
$ make coverage/unit
# $ make report/integration
```

esse comando irá gerar dois arquivos .html que mostram um report da coverage,
para abri-los, execute:

```bash
$ open .cover/unit.html
# $ open .cover/integration.html
```

---

