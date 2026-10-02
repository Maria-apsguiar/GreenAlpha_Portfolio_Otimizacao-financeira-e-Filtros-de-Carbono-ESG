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
| **Gênero** | Drama urbano · Finanças Quantitativas · Sustentabilidade |
| **Cenário** | Faria Lima, São Paulo, do amanhecer ao entardecer |
| **Episódios** | 9 |
| **Estúdio** | **Verde Valores Asset Management** |
| **Fonte original** | Cotações da B3 (Yahoo Finance) e Registro Público do GHG Protocol (FGVces) |
| **Clima visual** | Céu de pôr do sol, skyline iluminada, pétalas ao vento |
| **Trilha sugerida** | Lo-fi e city pop para rodar o script ouvindo |

---

## 🌅 SINOPSE

Numa manhã qualquer na Faria Lima, uma equipe de analistas quantitativos recebe a proposta que pode definir suas carreiras: um fundo soberano escandinavo quer confiar **R$ 500 milhões** a uma carteira que provou ser sustentável de verdade.

A condição é clara: a intensidade média de emissões de carbono precisa ser **pelo menos 40% menor que a média de mercado**, auditada sem margem para *greenwashing*.

Do outro lado da mesa, o Chief Investment Officer (CIO) tradicional e cético. Ele não é vilão — apenas acredita que desinvestir de gigantes como Petrobras e Vale destruirá o retorno fiduciário e elevará a volatilidade. Cabe à equipe responder não com discursos, mas com modelagem matemática rigorosa.

---

## 🎬 EPISÓDIOS

| EP | Título | Cena principal |
| :-: | :--- | :--- |
| 01 | **A Proposta** | O contrato de R$ 500M e o mandato nórdico |
| 02 | **O Diretor Cético** | A objeção clássica de risco vs. retorno |
| 03 | **Madrugada nos Dados** | Cotações diárias (2022–2024) e inventários de emissões |
| 04 | **A Equação** | Otimização convexa com SLSQP e Markowitz |
| 05 | **O Resultado** | Três carteiras lado a lado e dominância em Eco-Eficiência |
| 06 | **A Cidade em Números** | O dashboard analítico de 4 telas no Power BI |
| 07 | **Elenco** | O time de 8 especialistas por trás da solução |
| 08 | **Abertura** | Como configurar o ambiente e reproduzir o pipeline |
| 09 | **Próxima Temporada** | Roadmap futuro e o que aprendemos |

<div align="center"><img src="assets/divider.svg" width="100%" /></div>

## 🌸 EP 01 · A Proposta

O fundo soberano estabelece três condições pétreas:

- 🌱 Intensidade de carbono **≥ 40% menor** em relação à carteira tradicional
- 🔍 Emissões **auditáveis** com metodologia internacional do GHG Protocol (Escopos 1, 2 e 3)
- 📈 Desempenho fiduciário que preserve o **retorno ajustado ao risco (Sharpe)** diante do comitê

---

## 🌸 EP 02 · O Diretor Cético

> **O Chief Investment Officer:**
> *"Reduzir a exposição a Petrobras e Vale vai custar retorno e aumentar a oscilação. O mercado quer resultado, não boas intenções."*

A dúvida é legítima e reflete o ceticismo do mercado: **filtros ESG destroem a fronteira de eficiência?** A equipe opta por comprovar a tese empiricamente com dados históricos da B3.

---

## 🌸 EP 03 · Madrugada nos Dados

A base analítica foi consolidada integrando duas frentes oficiais:

| Fonte | Período / Universo | O que traz |
| :--- | :---: | :--- |
| 📈 **Yahoo Finance (`yfinance`)** | 03/01/2022 a 30/12/2024 | Cotações diárias de 10 ativos da B3: `ITUB4`, `WEGE3`, `RENT3`, `CPFE3`, `EQTL3`, `KLBN11`, `SUZB3`, `VBBR3`, `VALE3` e `PETR4` |
| 🌍 **GHG Protocol Brasil (FGVces)** | Ano-base corporativo auditado | Emissões absolutas de Escopo 1, 2 e 3 e Intensidade de Carbono ($tCO_2e$ por milhão de receita) |

---

## 🌸 EP 04 · A Equação

A resposta vem da **Teoria Moderna de Portfólio de Harry Markowitz**, formulada em Python com `scipy.optimize.minimize` pelo algoritmo **SLSQP** (*Sequential Least Squares Programming*), maximizando a razão de Sharpe sob taxa livre de risco de 10,5% a.a. (Selic/CDI):

<div align="center">

$$\max_{w} \; \text{Sharpe} = \frac{w^T \mu - r_f}{\sqrt{w^T \Sigma w}}$$

</div>

**As três regras da cena:**

| # | Restrição | Formulação | Significado no negócio |
| :-: | :--- | :---: | :--- |
| 1 | **Alocação Integral** | $\sum w_i = 1$ | 100% do capital alocado sem alavancagem |
| 2 | **Limite Estatutário** | $0 \le w_i \le 0.30$ | Máximo de 30% por ativo (sem short) para mitigar risco idiossincrático |
| 3 | **Teto Climático Convexo** | $\sum w_i \cdot \text{Intensidade}_i \le 20.0$ | Teto de emissão ponderada de até $20{,}0\text{ tCO}_2\text{e} / \text{R\$M}$ |

---

## 🌸 EP 05 · O Resultado

<div align="center">

| Métrica | Carteira Clássica<br>(Max Sharpe) | 🌿 **GreenAlpha ESG**<br>(Filtro Verde) | Carteira Defensiva<br>(Mín Volatilidade) |
| :--- | :---: | :---: | :---: |
| **Retorno anualizado** | 27,66% | **25,92%** | 15,94% |
| **Volatilidade anualizada** | 18,55% | **17,76%** | 14,65% |
| **Índice de Sharpe** | 0,925 | **0,869** | 0,371 |
| **Intensidade de carbono ($tCO_2e/M$)** | 41,22 | **20,00** | 27,95 |
| **Redução de emissões** | 0,00% | **-51,48%** | -32,18% |
| **Eco-Eficiência (Retorno / Carbono)** | 0,67 | **1,30** | 0,57 |

</div>

### ✨ A cena em três frases

- 🌱 **Superação da meta:** A intensidade de carbono caiu **51,48%** (superando com folga os 40% contratuais).
- 📉 **Risco controlado:** A volatilidade caiu de **18,55% para 17,76%**, desmontando a tese de que critérios ESG aumentam a instabilidade.
- ⚖️ **Eficiência preservada:** O portfólio manteve **94% do Sharpe** com custo marginal de retorno (25,92% vs. 27,66%), enquanto a **Eco-Eficiência praticamente dobrou (+94%)**, gerando 1,30 p.p. de retorno por tonelada emitida.

> O capital desinvestido de Petrobras (-19,61 p.p.) foi drenado para o setor Financeiro (`ITUB4`, +14,73 p.p.) e Utilidade Pública (`CPFE3` e `EQTL3`), mantendo `RENT3` no teto de 30% por sua boa intensidade relativa.

---

## 🌸 EP 06 · A Cidade em Números

O dashboard executivo em **Power BI Desktop** é estruturado em 4 telas orientadas à decisão:

| Tela | Nome | O que mostra |
| :-: | :--- | :--- |
| 1 | **Panorama Executivo** | Cards com KPIs centrais, comparativo de estratégias e barras 100% empilhadas de realocação de ativos |
| 2 | **Fronteira Eficiente ESG** | Dispersão com 2.500 iterações de Monte Carlo com gradiente de intensidade de carbono e os 3 pontos ótimos |
| 3 | **Deep Dive GHG Protocol** | Matriz detalhada dos 10 ativos com Escopos 1, 2 e 3 e gráfico decrescente de emissões totais |
| 4 | **Simulador What-If** | Parâmetro dinâmico com *slider* de metas (-10% a -50%) recalculando teto e Sharpe em tempo real |

> 📸 *Espaço para prints ou demonstrações do dashboard:*
>
> `![Panorama Executivo](docs/img/dashboard_tela1.png)`
> `![Fronteira Eficiente](docs/img/dashboard_tela2.png)`
> `![Deep Dive GHG Protocol](docs/img/dashboard_tela3.png)`
> `![Simulador What-If](docs/img/dashboard_tela4.png)`

---

## 🎨 DIREÇÃO DE ARTE

Identidade visual e paleta padronizada aplicada no banner e nos painéis analíticos:

| Cor | Hex | Uso Estratégico |
| :--- | :---: | :--- |
| 🟣 Roxo crepúsculo | `#5A2A8A` | Cabeçalhos e identidade visual corporativa |
| 🌸 Rosa sakura | `#FFC6DC` | Realces suaves, marcações e contrastes |
| 🌅 Laranja poente | `#FFB46E` | Pontos de atenção, alertas e linha de corte |
| 🌿 Verde GreenAlpha | `#7DFFB2` | Indicadores de tangência ESG e retorno limpo |
| 🌃 Azul noite | `#160C3A` | Fundo analítico escuro para visualização de dados |

---

## 🌸 EP 07 · Elenco (Equipe do Projeto)

<div align="center">

| Integrante | Papel no Projeto | Principais Frentes e Responsabilidades | Contato |
| :--- | :--- | :--- | :--- |
| **[Nome do Integrante 1]** | 🗄️ Arquiteto de Dados | Modelagem do Star Schema (`dim_empresa`, `fato_cotacoes`), DDL e auditoria de escopos | [LinkedIn](#) · [GitHub](#) |
| **[Nome do Integrante 2]** | 🔍 Engenheiro de Analytics SQL | Consultas de eco-eficiência, queries de rotação setorial e cálculo de pareto de emissões | [LinkedIn](#) · [GitHub](#) |
| **[Nome do Integrante 3]** | 📈 Analista Quantitativo | Ingestão via `yfinance`, séries históricas, retornos e cálculo da matriz de covariância | [LinkedIn](#) · [GitHub](#) |
| **[Nome do Integrante 4]** | 🧮 Especialista em Otimização | Formulação de Markowitz, restrições convexas no `scipy.optimize` e algoritmo SLSQP | [LinkedIn](#) · [GitHub](#) |
| **[Nome do Integrante 5]** | 🎲 Especialista em Simulação | Geração de Monte Carlo (2.500 iterações) e exportação dos dados da Fronteira Eficiente | [LinkedIn](#) · [GitHub](#) |
| **[Nome do Integrante 6]** | 📊 Engenheiro de BI (DAX) | Medidas DAX executivas, formatação condicional dinâmica e páginas executivas do Power BI | [LinkedIn](#) · [GitHub](#) |
| **[Nome do Integrante 7]** | 🎨 Designer de BI & UX/UI | Construção do simulador What-If, dispersão com gradiente de emissões e layout executivo | [LinkedIn](#) · [GitHub](#) |
| **[Nome do Integrante 8]** | 📖 Storytelling & QA Executivo | Estruturação metodológica STAR, documentação Git/README e validação cruzada dos KPIs | [LinkedIn](#) · [GitHub](#) |

</div>

---

## 🌸 EP 08 · Abertura (Como Rodar)

```bash
# 1. Clonar o repositório
git clone [https://github.com/SEU-USUARIO/GreenAlpha_Portfolio_Otimizacao-financeira-e-Filtros-de-Carbono-ESG.git](https://github.com/SEU-USUARIO/GreenAlpha_Portfolio_Otimizacao-financeira-e-Filtros-de-Carbono-ESG.git)
cd GreenAlpha_Portfolio_Otimizacao-financeira-e-Filtros-de-Carbono-ESG

# 2. Criar e ativar o ambiente virtual
python -m venv venv
# Windows:
venv\Scripts\activate
# macOS/Linux:
source venv/bin/activate

# 3. Instalar as dependências
pip install -r requirements.txt

# 4. Executar a modelagem e gerar as bases analíticas
python scripts/build_esg_portfolio_real.py
