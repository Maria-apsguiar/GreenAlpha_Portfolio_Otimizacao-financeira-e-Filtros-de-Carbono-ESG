<div align="center">

# 🌱⚡ GREENALPHA
### 〔 O DESPERTAR DA CARTEIRA ESG 〕
**Temporada 1 · Arco Faria Lima**

<p align="center">
  <img src="https://img.shields.io/badge/GÊNERO-SHONEN_FINANCEIRO-ff4500?style=for-the-badge" />
  <img src="https://img.shields.io/badge/ARCO-FARIA_LIMA-purple?style=for-the-badge" />
  <img src="https://img.shields.io/badge/STATUS-EM_EXIBIÇÃO-gold?style=for-the-badge" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Python-3.10%2B-blue?style=for-the-badge&logo=python&logoColor=white" />
  <img src="https://img.shields.io/badge/Pandas-Data_Analysis-150458?style=for-the-badge&logo=pandas&logoColor=white" />
  <img src="https://img.shields.io/badge/SciPy-SLSQP-8CAAE6?style=for-the-badge&logo=scipy&logoColor=white" />
  <img src="https://img.shields.io/badge/SQLite-Database-003B57?style=for-the-badge&logo=sqlite&logoColor=white" />
  <img src="https://img.shields.io/badge/Power_BI-Dashboard-F2C811?style=for-the-badge&logo=powerbi&logoColor=black" />
</p>

> *"Dizem que sustentabilidade e retorno não cabem na mesma carteira.*
> *Vamos provar que dizem errado."*

</div>

---

## 📺 SINOPSE

Uma equipe de jovens analistas quantitativos entra na **VerdeValores Asset Management**, na Faria Lima, quando um fundo soberano escandinavo faz uma oferta: administrar **R$ 500 milhões**.

Existe uma condição. A carteira precisa ter pegada de carbono auditada **pelo menos 40% menor que a média do mercado**, sem *greenwashing*.

Contra eles: um CIO cético, um mercado que só olha para o Sharpe e uma pergunta que ninguém consegue responder direito.

**É possível cortar carbono sem cortar retorno?**

---

## 🎞️ LISTA DE EPISÓDIOS

| EP | Título | O que acontece |
| :-: | :--- | :--- |
| 01 | [O Contrato de R$ 500 milhões](#-ep-01--o-contrato-de-r-500-milhões) | O desafio e as regras do jogo |
| 02 | [O Rival Cético](#-ep-02--o-rival-cético) | O CIO diz que a tese é impossível |
| 03 | [Reunindo os Dados](#-ep-03--reunindo-os-dados) | Cotações da B3 e emissões do GHG Protocol |
| 04 | [A Técnica Secreta](#-ep-04--a-técnica-secreta) | Otimização convexa com SLSQP |
| 05 | [O Despertar](#-ep-05--o-despertar) | As três formas da carteira, lado a lado |
| 06 | [O Painel de Comando](#-ep-06--o-painel-de-comando) | Dashboard no Power BI |
| 07 | [O Elenco](#-ep-07--o-elenco) | A equipe por trás do projeto |
| 08 | [Assistir Localmente](#-ep-08--assistir-localmente) | Como rodar o projeto |
| 09 | [Próximo Episódio](#-ep-09--próximo-episódio) | Roadmap e cena pós-créditos |

---

## 🎬 EP 01 · O Contrato de R$ 500 milhões

O fundo soberano escandinavo impõe a **Regra do Selo Escuro**:

- 🎯 Pegada de carbono **≥ 40% menor** que a média do mercado
- 🔍 Emissões **auditáveis** (nada de números bonitos sem fonte)
- 📈 Desempenho financeiro que **sustente a tese** perante o conselho

---

## 🎬 EP 02 · O Rival Cético

> **O CIO (rival):**
> *"Cortar Petrobras e Vale vai destruir o retorno e explodir a volatilidade. O mercado quer resultado, não floresta."*

Todo arco precisa de um rival à altura. O CIO representa a dúvida mais comum do mercado: a de que **ESG é custo**. A missão do time é responder com **dados**, não com discurso.

---

## 🎬 EP 03 · Reunindo os Dados

| Fonte | O que traz |
| :--- | :--- |
| 📈 **Cotações históricas (Yahoo Finance)** | Preços diários de 10 ativos da B3: `ITUB4`, `VALE3`, `PETR4`, `WEGE3`, `SUZB3`, `CPFE3`, `RENT3`, `VBBR3`, `KLBN11`, `EQTL3` |
| 🌍 **GHG Protocol** | Emissões de Escopo 1, 2 e 3 e intensidade de carbono (tCO₂e por milhão de receita) |

> ⚠️ *Período analisado, taxa livre de risco e ano-base das emissões: **[PREENCHER]**. Sem isso os números abaixo não são reproduzíveis.*

---

## 🎬 EP 04 · A Técnica Secreta

O golpe decisivo é a **otimização convexa** via `scipy.optimize` com o método **SLSQP** (*Sequential Least Squares Programming*):

<div align="center">

$$\max_{w} \; \text{Sharpe} = \frac{w^T \mu - r_f}{\sqrt{w^T \Sigma w}}$$

</div>

**As três regras do Selo:**

| # | Restrição | Significado |
| :-: | :--- | :--- |
| 1 | $\sum w_i = 1$ | Todo o capital é alocado |
| 2 | $0 \le w_i \le 0.30$ | Sem alavancagem; teto de 30% por ativo |
| 3 | $\sum w_i \cdot \text{Intensidade}_i \le 20.0$ | **Escudo de carbono**: teto rígido de emissão |

---

## 🎬 EP 05 · O Despertar

Três formas, uma comparação.

<div align="center">

| Atributo | ⚔️ Forma Base<br>(Max Sharpe) | 🌿 Forma Despertada<br>(**GreenAlpha ESG**) | 🛡️ Forma Defensiva<br>(Min Vol) |
| :--- | :---: | :---: | :---: |
| **Retorno anualizado** | 27,66% | **25,92%** | 15,94% |
| **Volatilidade** | 18,55% | **17,76%** | 14,65% |
| **Sharpe Ratio** | 0,925 | **0,869** | 0,371 |
| **Intensidade de carbono** (tCO₂e/M) | 41,22 | **20,00** | 27,95 |
| **Redução de carbono** | 0,0% | **-51,48%** | -32,18% |

</div>

### ✨ O que a transformação revelou

- 🌱 **Carbono cortado em 51,48%**, acima da meta de 40% do fundo
- 📉 **Volatilidade menor** que a da carteira tradicional (17,76% contra 18,55%)
- ⚡ **Cerca de 94% do Sharpe preservado** (0,869 contra 0,925)
- 🔄 O algoritmo reduziu a exposição às petroleiras e direcionou capital para **WEG, CPFL e Itaú**

> **Veredito do arco:** a dúvida do CIO era legítima, mas os dados mostram que, neste recorte, o custo de ser sustentável foi pequeno.

---

## 🎬 EP 06 · O Painel de Comando

O dashboard em **Power BI** tem 4 telas:

| Tela | Nome | O que mostra |
| :-: | :--- | :--- |
| 1 | **Panorama Executivo** | Retorno, risco e alocação por ativo |
| 2 | **Fronteira Eficiente** | 2.500 simulações de Monte Carlo, coloridas por intensidade de carbono |
| 3 | **Deep Dive GHG** | Emissões de Escopo 1, 2 e 3 por empresa |
| 4 | **Simulador What-If** | *Slider* que altera o teto de carbono e recalcula o Sharpe em tempo real |

> 📸 *Espaço reservado para prints ou GIF do dashboard:*
>
> `![Panorama Executivo](docs/img/dashboard_tela1.png)`
> `![Simulador What-If](docs/img/dashboard_whatif.gif)`

---

## 🎬 EP 07 · O Elenco

<div align="center">

| Personagem | Papel | Especialidade | Contato |
| :--- | :--- | :--- | :--- |
| **[Nome do Membro 1]** | 🧙 Estrategista de Dados | Python, extração do Yahoo Finance, matriz de covariância e otimização SLSQP | [LinkedIn](#) · [GitHub](#) |
| **[Nome do Membro 2]** | ⛏️ Engenheiro de Base | SQL, Star Schema (`dim_empresa`, `fato_cotacoes`) e consultas de eco-eficiência | [LinkedIn](#) · [GitHub](#) |
| **[Nome do Membro 3]** | 🎨 Designer de Painel | Power BI, medidas DAX, Fronteira Eficiente e simulador | [LinkedIn](#) · [GitHub](#) |
| **[Nome do Membro 4]** | 📖 Roteirista | Documentação, pitch no formato **STAR** e validação da tese | [LinkedIn](#) · [GitHub](#) |

</div>

---

## 🎬 EP 08 · Assistir Localmente

```bash
# 1. Clonar o repositório
git clone https://github.com/SEU-USUARIO/GreenAlpha_Portfolio_Otimizacao-financeira-e-Filtros-de-Carbono-ESG.git
cd GreenAlpha_Portfolio_Otimizacao-financeira-e-Filtros-de-Carbono-ESG

# 2. Criar e ativar um ambiente virtual (recomendado)
python -m venv venv
# Windows:
venv\Scripts\activate
# macOS/Linux:
source venv/bin/activate

# 3. Instalar as dependências
pip install -r requirements.txt

# 4. Rodar a otimização e gerar as bases para o Power BI
python scripts/build_esg_portfolio_real.py
```

**Estrutura do projeto** *(ajuste conforme o seu repositório)*:

```text
├── scripts/
│   └── build_esg_portfolio_real.py
├── data/            # CSVs gerados para o Power BI
├── docs/img/        # prints do dashboard
├── requirements.txt
└── README.md
```

---

## 🎬 EP 09 · Próximo Episódio

**Roadmap da Temporada 2**

- [ ] Ampliar o universo de ativos além dos 10 atuais
- [ ] Incorporar o índice **ICO2** da B3 como comparativo
- [ ] Testar out-of-sample (backtest com janela deslizante)
- [ ] Incluir custos de transação e rebalanceamento

> 🎥 **Cena pós-créditos:** e se o teto de carbono ficasse ainda mais rígido? O simulador What-If já permite testar.

---

## 📚 O Que Eu Aprendi

*(Uma linha por integrante. Recrutadores adoram esta seção.)*

- **[Nome 1]:** ...
- **[Nome 2]:** ...
- **[Nome 3]:** ...
- **[Nome 4]:** ...

---

## ⚠️ Aviso Legal

Este é um **projeto educacional e de portfólio**. Os resultados são **históricos**, dependem do período e das premissas usadas, e **não constituem recomendação de investimento**. Desempenho passado não garante desempenho futuro.

<div align="center">

**FIM DO EPISÓDIO · Obrigado por assistir 🌱**

⭐ *Se gostou do projeto, deixe uma estrela no repositório.*

</div>
