<div align="center">

# 🌿 GreenAlpha ESG Portfolio
### Otimização Quantitativa de Ativos & Descarbonização Fiduciária na B3

<p align="center">
  <b>Modern Portfolio Theory (Markowitz) · Otimização Convexa SLSQP · Métricas GHG Protocol · Business Intelligence</b>
</p>

<!-- Badges de Domínio e Status -->
<p align="center">
  <img src="https://img.shields.io/badge/Status-Concluído-10B981?style=for-the-badge&logoColor=white" />
  <img src="https://img.shields.io/badge/Mercado-B3_Brasil-1E3A34?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Mandato-R$_500M-064E3B?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Meta_ESG--51.48%25_CO₂-34D399?style=for-the-badge&labelColor=064E3B" />
</p>

<!-- Badges de Tecnologias / Hard Skills -->
<p align="center">
  <img src="https://img.shields.io/badge/Python-3.10%2B-1E3A34?style=flat-square&logo=python&logoColor=white" />
  <img src="https://img.shields.io/badge/SciPy-SLSQP_Optimization-10B981?style=flat-square&logo=scipy&logoColor=white" />
  <img src="https://img.shields.io/badge/Pandas-Data_Analysis-150458?style=flat-square&logo=pandas&logoColor=white" />
  <img src="https://img.shields.io/badge/NumPy-Matrix_Covariance-013243?style=flat-square&logo=numpy&logoColor=white" />
  <img src="https://img.shields.io/badge/SQLite-Star_Schema-003B57?style=flat-square&logo=sqlite&logoColor=white" />
  <img src="https://img.shields.io/badge/Power_BI-Executive_Dashboard-D97706?style=flat-square&logo=powerbi&logoColor=white" />
  <img src="https://img.shields.io/badge/DAX-Advanced_Measures-10B981?style=flat-square" />
  <img src="https://img.shields.io/badge/GHG_Protocol-FGVces-22C55E?style=flat-square" />
</p>

> *"Demonstração empírica de que a imposição de filtros de sustentabilidade rigorosos não destrói a fronteira de eficiência fiduciária: é viável descarbonizar mais de 50% de um portfólio de ações preservando 94% do Índice de Sharpe."*

---

</div>

## 📌 Sumário Executivo

- [Visão Geral do Projeto](#-visão-geral-do-projeto)
- [O Problema de Negócio (Desafio Fiduciário)](#-o-problema-de-negócio-desafio-fiduciário)
- [Arquitetura de Dados & Modelagem](#-arquitetura-de-dados--modelagem)
- [Formulação Quantitativa & Algoritmo](#-formulação-quantitativa--algoritmo)
- [Resultados Comparativos & Métricas](#-resultados-comparativos--métricas)
- [Dashboard Executivo (Power BI)](#-dashboard-executivo-power-bi)
- [Divisão da Equipe & Hardskills](#-equipe-e-responsabilidades-técnicas)
- [Como Reproduzir o Projeto](#-como-reproduzir-o-projeto)
- [Estrutura do Repositório](#-estrutura-do-repositório)

---

## 🎯 Visão Geral do Projeto

O **GreenAlpha ESG Portfolio** é uma solução quantitativa desenvolvida para gestores de ativos, family offices e comitês de alocação de recursos. O sistema combina a **Teoria Moderna de Portfólio (Markowitz)** com inventários de emissões do **Programa Brasileiro GHG Protocol (FGVces)** para estruturar carteiras de investimento na B3 que maximizam o retorno ajustado ao risco enquanto minimizam a intensidade de carbono ponderada.

### Principais Entregas
1. **Pipeline ETL:** Extração automatizada de cotações históricas diárias (2022–2024) via API e cruzamento com dados corporativos de emissões.
2. **Otimizador Convexo:** Algoritmo em Python utilizando `scipy.optimize.minimize` (método SLSQP) com restrições operacionais e teto de carbono.
3. **Data Warehouse (Star Schema):** Modelagem relacional analítica em SQLite para cálculo de rotação setorial e eco-eficiência.
4. **Dashboard Executivo:** Painel completo de tomada de decisão com simulação de Monte Carlo (2.500 iterações), radiografia de emissões e simulador What-If interativo.

---

## 💼 O Problema de Negócio (Desafio Fiduciário)

A **Verde Valores Asset Management** recebeu uma proposta institucional de **R$ 500 milhões** de um fundo de pensão nórdico com a exigência mandatória de estruturar uma carteira com pegada de carbono auditada **pelo menos 40% inferior à média do mercado**.

### O Dilema do CIO Tradicional
A gestão tradicional apontava que desinvestir de empresas de alto peso no índice Ibovespa (como Petrobras e Vale) acarretaria:
- Destruição da taxa de retorno esperada.
- Aumento da volatilidade e do risco de cauda do portfólio.
- Piora significativa na relação risco-retorno (Índice de Sharpe).

### A Resposta Empírica
O projeto comprovou matematicamente que a exclusão/redução de emissores fósseis pode ser absorvida eficientemente por setores limpos de infraestrutura e serviços (como Financeiro e Energia Renovável), mitigando a volatilidade global e mantendo a produtividade do capital.

---

## 🏗️ Arquitetura de Dados & Modelagem


```

```
                  FONTES DE DADOS PÚBLICAS
    ┌──────────────────────────────────────────────────┐
    │   Yahoo Finance API   │   GHG Protocol (FGVces)  │
    │  Cotações 2022 a 2024 │    Escopos 1, 2 e 3      │
    └───────────────┬──────────────────────────┬───────┘
                    │                          │
                    ▼                          ▼
           ┌────────────────────────────────────────┐
           │    Pipeline de Engenharia & Limpeza    │
           │         (Python / Pandas / ETL)        │
           └───────────────────┬────────────────────┘
                               ▼
    ┌────────────────────────────────────────────────────────┐
    │                 Star Schema (fintech_esg.db)            │
    │  • dim_empresa (Perfil, Setor, Emissões e Intensidade) │
    │  • fato_cotacoes_diarias (Histórico, Retorno, Ajustes) │
    │  • fato_pesos_carteiras (Pesos das Estratégias)        │
    │  • resumo_executivo_carteiras (Métricas Consolidadas)  │
    └───────────────┬──────────────────────────┬─────────────┘
                    │                          │
                    ▼                          ▼
    ┌───────────────────────────────┐ ┌──────────────────────┐
    │   Otimização SLSQP & MC       │ │  Camada Analítica BI │
    │  • SciPy / Markowitz          │ │  • Power BI Desktop  │
    │  • Simulação 2.500 carteiras  │ │  • Medidas em DAX    │
    └───────────────────────────────┘ └──────────────────────┘

```

```

### Universo de 10 Ativos Analisados
| Ticker | Empresa | Setor B3 | Intensidade ($tCO_2e/\text{R\$M}$) | Classificação Climática |
| :--- | :--- | :--- | :---: | :--- |
| `ITUB4.SA` | Itaú Unibanco | Financeiro | **1,8** | Líder Verde |
| `WEGE3.SA` | WEG | Bens Industriais | **8,4** | Baixa Emissão |
| `RENT3.SA` | Localiza | Consumo Cíclico | **9,2** | Moderada |
| `CPFE3.SA` | CPFL Energia | Utilidade Pública | **14,5** | Transição / Renovável |
| `EQTL3.SA` | Equatorial Energia | Utilidade Pública | **18,2** | Transição / Eficiente |
| `KLBN11.SA` | Klabin | Materiais Básicos | **38,5** | Média-Alta (Reflorestamento) |
| `SUZB3.SA` | Suzano | Materiais Básicos | **48,0** | Média-Alta (Remoção) |
| `VBBR3.SA` | Vibra Energia | Petróleo & Biocombustíveis | **54,0** | Alta (Distribuição) |
| `VALE3.SA` | Vale | Mineração / Materiais | **88,0** | Altíssima Intensidade |
| `PETR4.SA` | Petrobras | Petróleo & Gás | **112,0** | Altíssima Intensidade |

---

## 🧮 Formulação Quantitativa & Algoritmo

A modelagem baseia-se na maximização da Razão de Sharpe calculada sobre retornos anualizados (252 dias úteis) e taxa livre de risco referenciada em $r_f = 10{,}5\%$ a.a. (Selic/CDI):

$$\max_{w} \; \text{Sharpe} = \frac{w^T \mu - r_f}{\sqrt{w^T \Sigma w}}$$

### Vetores de Restrição
1. **Alocação Plena:** $\sum_{i=1}^{n} w_i = 1$ (100% do capital distribuído).
2. **Restrição Operacional Long-Only:** $0 \le w_i \le 0{,}30$ (sem short selling; teto máximo de 30% por ativo para diluição de risco idiossincrático).
3. **Teto de Emissões Ponderadas (Restrição Convexa):**

$$\sum_{i=1}^{n} w_i \cdot \text{Intensidade}_i \le 20{,}0 \text{ tCO}_2\text{e} / \text{R\$M}$$

---

## 📊 Resultados Comparativos & Métricas

A tabela a seguir apresenta os resultados empíricos calculados pelo otimizador SLSQP:

| Estratégia de Alocação | Retorno Anualizado | Volatilidade Anualizada | Índice de Sharpe | Intensidade Carbono ($tCO_2e/M$) | Redução de Carbono vs. Base | Eco-Eficiência (Retorno / Carbono) |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| 🌿 **GreenAlpha ESG (Filtro Verde)** | **25,92%** | **17,76%** | **0,869** | **20,00** | **-51,48%** | **1,30** |
| 🏢 **Tradicional (Max Sharpe)** | 27,66% | 18,55% | 0,925 | 41,22 | 0,00% | 0,67 |
| 🛡️ **Mínima Volatilidade (Defensiva)** | 15,94% | 14,65% | 0,371 | 27,95 | -32,18% | 0,57 |

### Principais Conclusões de Negócio
- **Meta Superada com Folga:** O teto de carbono promoveu um corte real de **-51,48%** na intensidade de emissões, superando com margem os 40% contratuais.
- **Risco Reduzido:** A volatilidade caiu de **18,55% para 17,76%**, comprovando que a descarbonização não desestabiliza o portfólio.
- **Custo Marginal de Retorno:** Abriu-se mão de apenas 1,74 p.p. de retorno (25,92% vs. 27,66%), com manutenção de **94% do Índice de Sharpe** original.
- **Dominância em Eco-Eficiência:** A métrica proprietária de Eco-Eficiência ($Retorno / Intensidade$) subiu **+94%** (de 0,67 para 1,30), provando que o capital tornou-se duas vezes mais produtivo sob a ótica climática.

### Rotação Setorial de Capital
- **Financiador da Redução:** Petrobras sofreu um desinvestimento de dois terços de sua posição (caindo de 29,0% para 9,39%).
- **Âncoras de Absorção:** O capital migrou para `ITUB4` (+14,73 p.p., atingindo 25,03%) e `CPFE3` (+5,58 p.p.), mantendo `RENT3` e `EQTL3` estáveis no teto de 30%.

---

## 🖥️ Dashboard Executivo (Power BI)

O painel foi construído adotando uma identidade visual executiva (*Dark Green Forest* `#1E3A34`, *Emerald Green* `#10B981` e *Slate Neutral* `#64748B`), estruturado em 4 telas orientadas à governança:

| Tela | Nome | Funcionalidades & Visualizações |
| :---: | :--- | :--- |
| **01** | **Panorama Executivo** | Cards de KPIs centrais (`Retorno 25,92%`, `Volatilidade 17,76%`, `Sharpe 0,869`, `Corte -51,48%`), comparativo de barras lado a lado e decomposição de alocação por ativo (gráfico 100% empilhado). |
| **02** | **Fronteira Eficiente** | Dispersão com 2.500 iterações de Monte Carlo coloridas pelo gradiente contínuo de intensidade de carbono, comparadas diretamente aos 3 pontos notáveis otimizados. |
| **03** | **Radiografia de Emissões** | Cards de escopos corporativos (Escopo 1: 65 Mi, Escopo 2: 3 Mi, Escopo 3: 493 Mi), matriz analítica detalhada dos 10 ativos e gráfico decrescente de emissões totais. |
| **04** | **Simulador What-If** | *Slider* com parâmetros interativos de redução (-10% a -50%), recalculando dinamicamente o teto de carbono, as carteiras válidas e o Sharpe resultante. |

> 📁 *Para visualizar as telas do projeto, consulte a pasta `docs/img/`.*

---

## 👥 Equipe e Responsabilidades Técnicas

Projeto desenvolvido por um time multidisciplinar de 8 analistas:

| Integrante | Função no Projeto | Principais Entregas & Hardskills | Contato |
| :--- | :--- | :--- | :--- |
| **[Nome Integrante 1]** | **Engenheiro de Dados** | Modelagem física e lógica do Star Schema relacional (`dim_empresa`, `fato_cotacoes_diarias`), DDL e validação primária em SQLite. | [LinkedIn](#) · [GitHub](#) |
| **[Nome Integrante 2]** | **Analytics Engineer (SQL)** | Desenvolvimento das queries de auditoria e cálculo de Eco-Eficiência, matriz de realocação setorial e agregação de escopos. | [LinkedIn](#) · [GitHub](#) |
| **[Nome Integrante 3]** | **Analista Quantitativo** | Ingestão e tratamento de séries temporais diárias da B3 via `yfinance`, cálculo de retornos e da matriz de covariância anualizada. | [LinkedIn](#) · [GitHub](#) |
| **[Nome Integrante 4]** | **Especialista em Otimização** | Formulação de Markowitz com restrição convexa no `scipy.optimize`, calibração do algoritmo SLSQP e teste de convergência dos pesos. | [LinkedIn](#) · [GitHub](#) |
| **[Nome Integrante 5]** | **Especialista em Simulação** | Desenvolvimento do script de Monte Carlo com 2.500 iterações aleatórias e consolidação da base da Fronteira Eficiente. | [LinkedIn](#) · [GitHub](#) |
| **[Nome Integrante 6]** | **Engenheiro de BI (DAX)** | Arquitetura das medidas calculadas em DAX (`Retorno_Anualizado_%`, `Indice_Sharpe`, `Eco_Eficiencia_Ratio`, etc.) e modelagem tabular. | [LinkedIn](#) · [GitHub](#) |
| **[Nome Integrante 7]** | **UX/UI & BI Designer** | Layout executivo no Power BI, configuração do gráfico de dispersão com gradiente de carbono e construção do Simulador What-If. | [LinkedIn](#) · [GitHub](#) |
| **[Nome Integrante 8]** | **Storytelling & QA Executivo** | Estruturação metodológica do case em formato STAR, auditoria cruzada dos números entre Python/SQL/PBI e liderança técnica do pitch. | [LinkedIn](#) · [GitHub](#) |

---

## 🚀 Como Reproduzir o Projeto

### Pré-requisitos
- Python 3.10 ou superior
- Power BI Desktop (versão atualizada para abertura do `.pbix`)

### Passo a Passo

```bash
# 1. Clonar o repositório
git clone [https://github.com/SEU-USUARIO/GreenAlpha-ESG-Portfolio.git](https://github.com/SEU-USUARIO/GreenAlpha-ESG-Portfolio.git)
cd GreenAlpha-ESG-Portfolio

# 2. Criar e ativar ambiente virtual
python -m venv venv
# Windows:
venv\Scripts\activate
# Linux/macOS:
source venv/bin/activate

# 3. Instalar as bibliotecas requeridas
pip install -r requirements.txt

# 4. Executar o pipeline de coleta, modelagem quantitativa e exportação dos datasets
python scripts/build_esg_portfolio_real.py

# 5. Abrir o relatório no Power BI
# Execute o arquivo 'pbix/GreenAlpha_Dashboard.pbix' e atualize a fonte de dados para a pasta /data

```

---

## 📂 Estrutura do Repositório

```text
├── data/
│   ├── dim_empresa.csv                     # Dimensão de empresas, setores e emissões
│   ├── fato_cotacoes_diarias.csv          # Cotações históricas da B3 (2022-2024)
│   ├── fato_pesos_carteiras.csv           # Alocações calculadas para cada estratégia
│   ├── fronteira_eficiente_monte_carlo.csv# 2.500 pontos da simulação de Markowitz
│   ├── fintech_esg.db                      # Banco de dados SQLite relacional
│   └── resumo_executivo_carteiras.csv     # Tabela consolidada com os KPIs centrais
├── docs/
│   └── img/                               # Demonstrações e capturas do dashboard
├── pbix/
│   └── GreenAlpha_Dashboard.pbix          # Dashboard do Power BI Desktop
├── scripts/
│   ├── build_esg_portfolio_real.py        # Pipeline de dados, SLSQP e Monte Carlo
│   └── queries_analiticas.sql             # Scripts SQL de auditoria e rotação setorial
├── requirements.txt                       # Dependências do projeto (pandas, scipy, etc.)
└── README.md                              # Documentação oficial do projeto

```

---

## ⚖️ Aviso Legal (Disclaimer)

Este projeto foi desenvolvido para **fins educacionais e acadêmicos**, constituindo material de portfólio em análise de dados e finanças quantitativas. Os dados utilizados referem-se a séries históricas (2022 a 2024) e **não representam aconselhamento fiduciário nem recomendação de compra ou venda de ativos mobiliários**.

---
