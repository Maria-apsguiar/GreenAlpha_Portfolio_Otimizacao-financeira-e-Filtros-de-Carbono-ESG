create database greenalpha;
use greenalpha;
-- ===================================================================
-- CASE 3: GreenAlpha Fintech ESG - Modelagem Dimensional
-- Otimização de Carteiras de Investimento (Markowitz + Filtros Verdes)
-- Dados Reais: B3 (Yahoo Finance) e GHG Protocol Brasil
-- ===================================================================

-- 1. Dimensão Ativos / Empresas (dim_empresa)
DROP TABLE IF EXISTS dim_empresa;
CREATE TABLE dim_empresa (
    ticker VARCHAR(10) PRIMARY KEY,
    empresa VARCHAR(100) NOT NULL,
    setor VARCHAR(50) NOT NULL,
    subsetor VARCHAR(100) NOT NULL,
    emissoes_escopo1_tco2e NUMERIC(12,2) NOT NULL,
    emissoes_escopo2_tco2e NUMERIC(12,2) NOT NULL,
    emissoes_escopo3_tco2e NUMERIC(12,2) NOT NULL,
    intensidade_carbono_tco2e_m NUMERIC(8,2) NOT NULL,
    classificacao_esg VARCHAR(50) NOT NULL
);

-- 2. Tabela de Resumo Executivo das Carteiras (resumo_executivo_carteiras)
DROP TABLE IF EXISTS resumo_executivo_carteiras;
CREATE TABLE resumo_executivo_carteiras (
    carteira VARCHAR(50) PRIMARY KEY,
    descricao VARCHAR(200) NOT NULL,
    retorno_anualizado_pct NUMERIC(6,2) NOT NULL,
    volatilidade_anualizada_pct NUMERIC(6,2) NOT NULL,
    indice_sharpe NUMERIC(6,3) NOT NULL,
    intensidade_carbono_tco2e_m NUMERIC(8,2) NOT NULL,
    reducao_carbono_vs_tradicional_pct NUMERIC(6,2) NOT NULL
);

-- 3. Tabela Fato: Pesos Alocados por Ativo em cada Estratégia (fato_pesos_carteiras)
DROP TABLE IF EXISTS fato_pesos_carteiras;
CREATE TABLE fato_pesos_carteiras (
    ticker VARCHAR(10) PRIMARY KEY REFERENCES dim_empresa(ticker),
    empresa VARCHAR(100) NOT NULL,
    setor VARCHAR(50) NOT NULL,
    intensidade_carbono_ativo NUMERIC(8,2) NOT NULL,
    peso_carteira_tradicional_pct NUMERIC(6,2) NOT NULL,
    peso_carteira_min_vol_pct NUMERIC(6,2) NOT NULL,
    peso_carteira_greenalpha_esg_pct NUMERIC(6,2) NOT NULL
);

-- 4. Tabela Fato: Cotações Diárias Históricas Reais (fato_cotacoes_diarias)
DROP TABLE IF EXISTS fato_cotacoes_diarias;
CREATE TABLE fato_cotacoes_diarias (
    date DATE NOT NULL,
    ticker VARCHAR(10) NOT NULL REFERENCES dim_empresa(ticker),
    preco_fechamento_ajustado NUMERIC(10,4) NOT NULL,
    PRIMARY KEY (date, ticker)
);

-- 5. Tabela de Simulação de Monte Carlo / Fronteira Eficiente
DROP TABLE IF EXISTS fronteira_eficiente_monte_carlo;
CREATE TABLE fronteira_eficiente_monte_carlo (
    simulacao_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    retorno_anualizado_pct NUMERIC(6,2) NOT NULL,
    volatilidade_anualizada_pct NUMERIC(6,2) NOT NULL,
    indice_sharpe NUMERIC(6,3) NOT NULL,
    intensidade_carbono_carteira NUMERIC(8,2) NOT NULL
);

CREATE INDEX idx_cotacoes_ticker ON fato_cotacoes_diarias(ticker);
CREATE INDEX idx_cotacoes_date ON fato_cotacoes_diarias(date);
