<div align="center">

<img src="assets/banner.svg" alt="GreenAlpha - O Despertar da Carteira ESG" width="100%" />

<br/>

<p align="center">
  <img src="https://img.shields.io/badge/GÊNERO-DRAMA_URBANO-b98cff?style=for-the-badge" />
  <img src="https://img.shields.io/badge/CENÁRIO-FARIA_LIMA-ff8fb8?style=for-the-badge" />
  <img src="https://img.shields.io/badge/TEMPORADA-1-7dffb2?style=for-the-badge&labelColor=222" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Python-3.10%2B-blue?style=flat-square&logo=python&logoColor=white" />
  <img src="https://img.shields.io/badge/Pandas-Data_Analysis-150458?style=flat-square&logo=pandas&logoColor=white" />
  <img src="https://img.shields.io/badge/SciPy-SLSQP-8CAAE6?style=flat-square&logo=scipy&logoColor=white" />
  <img src="https://img.shields.io/badge/SQLite-Database-003B57?style=flat-square&logo=sqlite&logoColor=white" />
  <img src="https://img.shields.io/badge/Power_BI-Dashboard-F2C811?style=flat-square&logo=powerbi&logoColor=black" />
</p>

*"Entre o retorno e o planeta, sempre disseram que era preciso escolher.*
*E se a resposta estivesse nos dados?"*

<img src="assets/divider.svg" width="100%" />

</div>

## 🎴 FICHA DO ANIME

| | |
| :--- | :--- |
| **Título** | GreenAlpha: O Despertar da Carteira ESG |
| **Gênero** | Drama urbano · Sonhos de carreira · Finanças |
| **Cenário** | Faria Lima, São Paulo, do amanhecer ao entardecer |
| **Episódios** | 9 |
| **Estúdio** | **[Nome da equipe]** |
| **Fonte original** | Dados reais da B3 e do GHG Protocol |
| **Clima visual** | Céu de pôr do sol, skyline iluminada, pétalas ao vento |
| **Trilha sugerida** | Lo-fi e city pop para rodar o script ouvindo |

---

## 🌅 SINOPSE

Numa manhã qualquer na Faria Lima, um grupo de jovens analistas recebe a proposta que pode definir suas carreiras: um fundo soberano escandinavo quer confiar **R$ 500 milhões** a uma carteira que provou ser sustentável de verdade.

A condição é clara. A pegada de carbono precisa ser **pelo menos 40% menor que a média do mercado**, com números auditados e sem *greenwashing*.

Do outro lado da mesa, um diretor de investimentos experiente e cético. Ele não é vilão. Ele apenas acredita que sustentabilidade tem um custo alto demais. E cabe à equipe responder com dados, em vez de discursos.

---

## 🎬 EPISÓDIOS

| EP | Título | Cena principal |
| :-: | :--- | :--- |
| 01 | **A Proposta** | O contrato e a regra do fundo |
| 02 | **O Diretor Cético** | A dúvida que o mercado carrega |
| 03 | **Madrugada nos Dados** | Cotações da B3 e emissões do GHG Protocol |
| 04 | **A Equação** | Otimização com SLSQP |
| 05 | **O Resultado** | Três carteiras lado a lado |
| 06 | **A Cidade em Números** | O dashboard no Power BI |
| 07 | **Elenco** | Quem fez o projeto |
| 08 | **Abertura** | Como rodar o projeto |
| 09 | **Próxima Temporada** | Roadmap e cena pós-créditos |

<div align="center"><img src="assets/divider.svg" width="100%" /></div>

## 🌸 EP 01 · A Proposta

O fundo soberano define três condições:

- 🌱 Pegada de carbono **≥ 40% menor** que a média do mercado
- 🔍 Emissões **auditáveis**, com fonte pública
- 📈 Desempenho financeiro que **sustente a tese** diante do conselho

---

## 🌸 EP 02 · O Diretor Cético

> **O diretor de investimentos:**
> *"Reduzir a exposição a Petrobras e Vale vai custar retorno e aumentar a oscilação. O mercado quer resultado, não boas intenções."*

A dúvida dele é legítima, e é a mesma que muita gente do mercado tem: **ESG reduz performance?** A equipe decide não discutir e testar.

---

## 🌸 EP 03 · Madrugada nos Dados

Depois do expediente, a equipe monta a base do projeto.

| Fonte | O que traz |
| :--- | :--- |
| 📈 **Cotações históricas (Yahoo Finance)** | Preços diários de 10 ativos: `ITUB4`, `VALE3`, `PETR4`, `WEGE3`, `SUZB3`, `CPFE3`, `RENT3`, `VBBR3`, `KLBN11`, `EQTL3` |
| 🌍 **GHG Protocol** | Emissões de Escopo 1, 2 e 3 e intensidade de carbono (tCO₂e por milhão de receita) |

> ⚠️ *Período analisado, taxa livre de risco e ano-base das emissões: **[PREENCHER]**. Sem isso os números abaixo não são reproduzíveis.*

---

## 🌸 EP 04 · A Equação

A resposta vem de uma **otimização convexa** com `scipy.optimize` (método **SLSQP**), que busca o melhor equilíbrio entre retorno e risco:

<div align="center">

$$\max_{w} \; \text{Sharpe} = \frac{w^T \mu - r_f}{\sqrt{w^T \Sigma w}}$$

</div>

**As três regras da cena:**

| # | Restrição | Em palavras simples |
| :-: | :--- | :--- |
| 1 | $\sum w_i = 1$ | Todo o capital é alocado |
| 2 | $0 \le w_i \le 0.30$ | Nenhum ativo passa de 30% da carteira |
| 3 | $\sum w_i \cdot \text{Intensidade}_i \le 20.0$ | Teto de carbono da carteira |

---

## 🌸 EP 05 · O Resultado

<div align="center">

| | Carteira Clássica<br>(Max Sharpe) | 🌿 **GreenAlpha ESG** | Carteira Defensiva<br>(Min Vol) |
| :--- | :---: | :---: | :---: |
| **Retorno anualizado** | 27,66% | **25,92%** | 15,94% |
| **Volatilidade** | 18,55% | **17,76%** | 14,65% |
| **Sharpe Ratio** | 0,925 | **0,869** | 0,371 |
| **Intensidade de carbono** (tCO₂e/M) | 41,22 | **20,00** | 27,95 |
| **Redução de carbono** | 0,0% | **-51,48%** | -32,18% |

</div>

### ✨ A cena em três frases

- 🌱 O carbono caiu **51,48%**, acima da meta de 40%.
- 📉 A volatilidade ficou **menor** que a da carteira clássica (17,76% contra 18,55%).
- ⚖️ Cerca de **94% do Sharpe** foi preservado (0,869 contra 0,925), com capital realocado das petroleiras para **WEG, CPFL e Itaú**.

> Na sala de reunião, o diretor olha os números em silêncio. Depois acena com a cabeça.
> *Nem toda dúvida precisa de um vencedor. Às vezes só precisa de dados.*

---

## 🌸 EP 06 · A Cidade em Números

O dashboard em **Power BI** tem 4 telas:

| Tela | Nome | O que mostra |
| :-: | :--- | :--- |
| 1 | **Panorama Executivo** | Retorno, risco e alocação por ativo |
| 2 | **Fronteira Eficiente** | 2.500 simulações de Monte Carlo, coloridas por intensidade de carbono |
| 3 | **Radiografia GHG** | Emissões de Escopo 1, 2 e 3 por empresa |
| 4 | **Simulador What-If** | *Slider* que altera o teto de carbono e recalcula o Sharpe em tempo real |

> 📸 *Espaço para prints ou GIF do dashboard:*
>
> `![Panorama Executivo](docs/img/dashboard_tela1.png)`
> `![Simulador What-If](docs/img/dashboard_whatif.gif)`

---

## 🎨 DIREÇÃO DE ARTE

Paleta usada no banner e sugerida para o dashboard, para manter a identidade visual do projeto:

| Cor | Hex | Uso |
| :--- | :---: | :--- |
| 🟣 Roxo crepúsculo | `#5A2A8A` | Fundo e títulos |
| 🌸 Rosa sakura | `#FFC6DC` | Detalhes e destaques suaves |
| 🌅 Laranja poente | `#FFB46E` | Barra de horizonte, alertas |
| 🌿 Verde GreenAlpha | `#7DFFB2` | Linha de crescimento e ESG |
| 🌃 Azul noite | `#160C3A` | Fundo escuro do dashboard |

**Galeria (mood board):** *coloque aqui suas ilustrações originais*

| | | |
| :---: | :---: | :---: |
| `assets/arte_01.png` | `assets/arte_02.png` | `assets/arte_03.png` |
| Skyline ao entardecer | Sala de reunião ao amanhecer | Equipe olhando o dashboard |

---

## 🌸 EP 07 · Elenco

<div align="center">

| Personagem | Função | Especialidade | Contato |
| :--- | :--- | :--- | :--- |
| **[Nome do Membro 1]** | 🧮 A analista de dados | Python, Yahoo Finance, matriz de covariância e SLSQP | [LinkedIn](#) · [GitHub](#) |
| **[Nome do Membro 2]** | 🗄️ O guardião da base | SQL, Star Schema (`dim_empresa`, `fato_cotacoes`) e consultas de eco-eficiência | [LinkedIn](#) · [GitHub](#) |
| **[Nome do Membro 3]** | 🎨 A designer do painel | Power BI, medidas DAX, Fronteira Eficiente e simulador | [LinkedIn](#) · [GitHub](#) |
| **[Nome do Membro 4]** | 📖 O roteirista | Documentação, pitch no formato **STAR** e validação da tese | [LinkedIn](#) · [GitHub](#) |

</div>

---

## 🌸 EP 08 · Abertura (Como Rodar)

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
├── assets/          # banner, divisor e ilustrações
├── scripts/
│   └── build_esg_portfolio_real.py
├── data/            # CSVs gerados para o Power BI
├── docs/img/        # prints do dashboard
├── requirements.txt
└── README.md
```

---

## 🌸 EP 09 · Próxima Temporada

- [ ] Ampliar a carteira além dos 10 ativos atuais
- [ ] Comparar com o índice **ICO2** da B3
- [ ] Testar out-of-sample (backtest com janela deslizante)
- [ ] Incluir custos de transação e rebalanceamento

> 🎞️ **Cena pós-créditos:** o teto de carbono cai um pouco mais. O simulador What-If já deixa você testar o que acontece.

---

## 📚 O Que Eu Aprendi

*(Uma linha por integrante. Recrutadores costumam ler esta seção.)*

- **[Nome 1]:** ...
- **[Nome 2]:** ...
- **[Nome 3]:** ...
- **[Nome 4]:** ...

---

## ⚠️ Aviso Legal

Este é um **projeto educacional e de portfólio**. Os resultados são **históricos**, dependem do período e das premissas usadas, e **não constituem recomendação de investimento**. Desempenho passado não garante desempenho futuro.

<div align="center">

<img src="assets/divider.svg" width="100%" />

**FIM DO EPISÓDIO · Obrigado por assistir 🌸**

⭐ *Se gostou do projeto, deixe uma estrela no repositório.*

</div>
