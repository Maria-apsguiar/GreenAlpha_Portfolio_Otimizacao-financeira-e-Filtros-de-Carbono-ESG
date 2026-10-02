SELECT 
    carteira,
    retorno_anualizado_pct,
    volatilidade_anualizada_pct,
    indice_sharpe,
    intensidade_carbono_tco2e_m,
    reducao_carbono_vs_tradicional_pct,
    ROUND(retorno_anualizado_pct / NULLIF(intensidade_carbono_tco2e_m, 0), 2) AS eco_eficiencia_retorno_por_carbono
FROM resumo_executivo_carteiras
ORDER BY indice_sharpe DESC;

INSERT INTO `dim_empresa` (`Ticker`, `Empresa`, `Setor`, `Subsetor`, `Emissoes_Escopo1_tCO2e`, `Emissoes_Escopo2_tCO2e`, `Emissoes_Escopo3_tCO2e`, `Intensidade_Carbono_tCO2e_M`, `Classificacao_ESG`) VALUES
  ('ITUB4.SA', 'Itau Unibanco', 'Financeiro', 'Bancos', 12500, 38000, 2400000, 1.8, 'Lider Verde (Baixa Emissao)'),
  ('WEGE3.SA', 'WEG', 'Bens Industriais', 'Motores & Energia Eolica', 85000, 110000, 1850000, 8.4, 'Lider Verde (Transicao Energetica)'),
  ('RENT3.SA', 'Localiza', 'Consumo Ciclico', 'Aluguel de Frotas', 95000, 18000, 4200000, 9.2, 'Moderada Emissao'),
  ('CPFE3.SA', 'CPFL Energia', 'Utilidade Publica', 'Energia Eletrica / Renovaveis', 240000, 42000, 980000, 14.5, 'Moderada Emissao'),
  ('EQTL3.SA', 'Equatorial Energia', 'Utilidade Publica', 'Distribuicao Eletrica', 310000, 55000, 1200000, 18.2, 'Moderada Emissao'),
  ('KLBN11.SA', 'Klabin', 'Materiais Basicos', 'Papel & Embalagens', 890000, 120000, 1600000, 38.5, 'Intensiva com Remocao'),
  ('SUZB3.SA', 'Suzano', 'Materiais Basicos', 'Papel & Celulose', 2100000, 180000, 3100000, 48.0, 'Intensiva com Remocao'),
  ('VBBR3.SA', 'Vibra Energia', 'Petroleo & Biocombustiveis', 'Distribuicao', 450000, 68000, 8500000, 54.0, 'Intensiva em Escopo 3'),
  ('VALE3.SA', 'Vale', 'Materiais Basicos', 'Mineracao', 8900000, 540000, 89000000, 88.0, 'Alta Intensidade'),
  ('PETR4.SA', 'Petrobras', 'Petroleo & Gas', 'Exploracao & Refino', 52000000, 2100000, 380000000, 112.0, 'Altissima Intensidade');
  
  select * from resumo_executivo_carteiras;
  
  INSERT INTO `fato_pesos_carteiras` VALUES
  ('ITUB4.SA', 'Itau Unibanco', 'Financeiro', 1.8, 10.3, 18.22, 25.03),
  ('WEGE3.SA', 'WEG', 'Bens Industriais', 8.4, 0.0, 9.71, 0.0),
  ('RENT3.SA', 'Localiza', 'Consumo Ciclico', 9.2, 30.0, 16.81, 30.0),
  ('CPFE3.SA', 'CPFL Energia', 'Utilidade Publica', 14.5, 0.0, 16.4, 5.58),
  ('EQTL3.SA', 'Equatorial Energia', 'Utilidade Publica', 18.2, 30.0, 8.32, 30.0),
  ('KLBN11.SA', 'Klabin', 'Materiais Basicos', 38.5, 0.0, 0.0, 0.0),
  ('SUZB3.SA', 'Suzano', 'Materiais Basicos', 48.0, 0.7, 10.64, 0.0),
  ('VBBR3.SA', 'Vibra Energia', 'Petroleo & Biocombustiveis', 54.0, 0.0, 10.41, 0.0),
  ('VALE3.SA', 'Vale', 'Materiais Basicos', 88.0, 0.0, 0.0, 0.0),
  ('PETR4.SA', 'Petrobras', 'Petroleo & Gas', 112.0, 29.0, 9.5, 9.39);
  
  INSERT INTO `resumo_executivo_carteiras` VALUES
  ('Tradicional (Max Sharpe Irrestrito)', 'Otimizacao pura de retorno ajustado ao risco sem limites de emissoes', 27.66, 18.55, 0.925, 41.22, 0.0),
  ('GreenAlpha ESG (Filtro Verde)', 'Max Sharpe com teto maximo de 20.0 tCO2e/M de receita', 25.92, 17.76, 0.869, 20.0, 51.48),
  ('Minima Volatilidade (Defensiva)', 'Minimizacao absoluta do desvio padrao da carteira', 15.94, 14.65, 0.371, 27.95, 32.18);
  
  SELECT 
    e.setor,
    COUNT(DISTINCT p.ticker) AS qtd_empresas,
    ROUND(SUM(p.peso_carteira_tradicional_pct), 2) AS peso_tradicional_total_pct,
    ROUND(SUM(p.peso_carteira_greenalpha_esg_pct), 2) AS peso_greenalpha_total_pct,
    ROUND(
        SUM(p.peso_carteira_greenalpha_esg_pct) - SUM(p.peso_carteira_tradicional_pct), 
        2
    ) AS variacao_alocacao_setorial_pct,
    ROUND(AVG(e.intensidade_carbono_tco2e_m), 1) AS media_intensidade_carbono_setor
FROM fato_pesos_carteiras p
JOIN dim_empresa e ON p.ticker = e.ticker
GROUP BY e.setor
ORDER BY variacao_alocacao_setorial_pct DESC;

SELECT 
    ticker,
    empresa,
    setor,
    classificacao_esg,
    intensidade_carbono_tco2e_m,
    ROUND(emissoes_escopo1_tco2e / 1000.0, 1) AS escopo1_mil_t,
    ROUND(emissoes_escopo2_tco2e / 1000.0, 1) AS escopo2_mil_t,
    ROUND(emissoes_escopo3_tco2e / 1000.0, 1) AS escopo3_mil_t,
    ROUND(
        (emissoes_escopo1_tco2e + emissoes_escopo2_tco2e + emissoes_escopo3_tco2e) / 1000000.0, 
        2
    ) AS total_emissoes_milhoes_tco2e
FROM dim_empresa
ORDER BY total_emissoes_milhoes_tco2e DESC;