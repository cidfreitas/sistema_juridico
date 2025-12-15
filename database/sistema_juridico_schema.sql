BEGIN TRANSACTION;
CREATE TABLE andamentos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    processo_id INTEGER NOT NULL,
    
    data_andamento DATE NOT NULL,
    tipo_andamento TEXT NOT NULL,
    descricao TEXT NOT NULL,
    
    data_scraping TIMESTAMP,
    fonte TEXT CHECK(fonte IN ('tjsp', 'stj', 'stf', 'manual', 'email')),
    
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (processo_id) REFERENCES processos(id) ON DELETE CASCADE,
    UNIQUE(processo_id, data_andamento, descricao)
);
INSERT INTO "andamentos" VALUES(1,88,'11-12-2025','automático','Certidão de Publicação Expedida Relação: 1780/2025_x000D_
Data da Publicação: 12/12/2025','2025-12-12 13:50:47.538344','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(2,88,'10-12-2025','automático','Remetido ao DJE Relação: 1780/2025_x000D_
Teor do ato: Fls. 358 - Mandado de Levantamento Eletrônico (MLE) expedido em favor da Parte Exequente e, aguardando pela conferência e assinatura do Diretor de Serviço e do MMº. Juiz de Direito._x000D_
Advogados(s): Cid Carlos de Freitas (OAB 231735/SP), Luís Carlos Carvalho Firmino (OAB 448957/SP)','2025-12-12 13:50:47.538956','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(3,88,'10-12-2025','automático','Ato Ordinatório - Intimação - DJE Fls. 358 - Mandado de Levantamento Eletrônico (MLE) expedido em favor da Parte Exequente e, aguardando pela conferência e assinatura do Diretor de Serviço e do MMº. Juiz de Direito.','2025-12-12 13:50:47.539005','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(4,80,'10-12-2025','automático','Conclusos para o Relator','2025-12-12 13:50:47.539043','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(5,58,'10-12-2025','automático','Conclusos para Despacho','2025-12-12 13:50:47.539076','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(6,88,'10-12-2025','automático','Documento Juntado','2025-12-12 13:50:47.539108','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(7,99,'10-12-2025','automático','Certidão de Publicação Expedida Relação: 2406/2025_x000D_
Data da Publicação: 11/12/2025','2025-12-12 13:50:47.539138','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(8,87,'10-12-2025','automático','Prazo','2025-12-12 13:50:47.539169','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(9,1,'09-12-2025','automático','Conclusos para Decisão','2025-12-12 13:50:47.539199','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(10,58,'09-12-2025','automático','Expedido Certidão de Baixa de Recurso Certidão de Baixa de Recurso - [Digital]','2025-12-12 13:50:47.539228','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(11,80,'09-12-2025','automático','Juntada de petição Protocolo nº WPRO.2501984240-0 Embargos de Declaração Cível','2025-12-12 13:50:47.539258','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(12,80,'09-12-2025','automático','Subprocesso Cadastrado Processo principal: 1000565-19.2023.8.26.0073','2025-12-12 13:50:47.539288','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(13,66,'09-12-2025','automático','Processo encaminhado para o Magistrado','2025-12-12 13:50:47.539318','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(14,58,'09-12-2025','automático','Trânsito em julgado em 02/12/2025','2025-12-12 13:50:47.539348','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(15,58,'09-12-2025','automático','Baixa Definitiva','2025-12-12 13:50:47.539377','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(16,99,'09-12-2025','automático','Remetido ao DJE Relação: 2406/2025_x000D_
Teor do ato: Fls. 145/146: Ciência ao executado._x000D_
Advogados(s): Sebastiao Antonio de Carvalho (OAB 101857/SP), Cid Carlos de Freitas (OAB 231735/SP), Natália Marques de Carvalho de Oliveira (OAB 282367/SP), Roziane Silio Clarindo (OAB 353222/SP)','2025-12-12 13:50:47.539407','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(17,99,'09-12-2025','automático','Petição Juntada Nº Protocolo: WJMJ.25.42770093-5_x000D_
Tipo da Petição: Petição Intermediária_x000D_
Data: 09/12/2025 10:12','2025-12-12 13:50:47.539438','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(18,99,'09-12-2025','automático','Ato Ordinatório - Intimação - DJE Fls. 145/146: Ciência ao executado.','2025-12-12 13:50:47.539472','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(19,21,'09-12-2025','automático','Decurso de Prazo Certidão Embargos de Declaração tempestivos','2025-12-12 13:50:47.539502','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(20,58,'09-12-2025','automático','Recebidos os Autos do Tribunal de Justiça','2025-12-12 13:50:47.539532','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(21,1,'09-12-2025','automático','Documento Juntado','2025-12-12 13:50:47.539562','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(22,78,'09-12-2025','automático','Certidão de Publicação Expedida Relação: 1759/2025_x000D_
Data da Publicação: 10/12/2025','2025-12-12 13:50:47.539591','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(23,80,'09-12-2025','automático','Subprocesso Cadastrado Seq.: 50 - Embargos de Declaração Cível','2025-12-12 13:50:47.539621','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(24,58,'09-12-2025','automático','Expedido Certidão Certifico que o v. acórdão transitou em julgado em 02/12/2025.','2025-12-12 13:50:47.539650','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(25,91,'09-12-2025','automático','Expedido Certidão Certifico que o(s) r(r). despacho(s) retro(s) foi(ram) disponibilizado(s) no Diário de Justiça Eletrônico Nacional - DJEN de hoje. Considera-se data da publicação o primeiro dia útil subsequente.','2025-12-12 13:50:47.539680','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(26,21,'09-12-2025','automático','Conclusos para Decisão','2025-12-12 13:50:47.539735','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(27,87,'09-12-2025','automático','Expedido Certidão Certifico que o(s) r(r). despacho(s) retro(s) foi(ram) disponibilizado(s) no Diário de Justiça Eletrônico Nacional - DJEN de hoje. Considera-se data da publicação o primeiro dia útil subsequente.','2025-12-12 13:50:47.539765','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(28,87,'09-12-2025','automático','Conclusos para o Relator','2025-12-12 13:50:47.539793','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(29,87,'09-12-2025','automático','Juntada de petição Nº Protocolo: WPRO.25.01997965-1_x000D_
Tipo da Petição: Petições Diversas_x000D_
Data: 09/12/2025 14:12','2025-12-12 13:50:47.539819','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(30,87,'09-12-2025','automático','Expedido Termo Termo de Juntada - Automática','2025-12-12 13:50:47.539846','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(31,17,'09-12-2025','automático','Petição Juntada Nº Protocolo: WVPT.25.70064898-9_x000D_
Tipo da Petição: Petições Diversas_x000D_
Data: 09/12/2025 14:37','2025-12-12 13:50:47.539873','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(32,91,'09-12-2025','automático','Conclusos para o Relator','2025-12-12 13:50:47.539900','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(33,21,'08-12-2025','automático','Embargos de Declaração Juntados Nº Protocolo: WPDR.25.70038312-8_x000D_
Tipo da Petição: Embargos de Declaração_x000D_
Data: 08/12/2025 07:19','2025-12-12 13:50:47.539926','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(34,97,'08-12-2025','automático','Petição Juntada Nº Protocolo: WITU.25.70147721-5_x000D_
Tipo da Petição: Manifestação do Perito_x000D_
Data: 08/12/2025 11:19','2025-12-12 13:50:47.539953','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(35,88,'08-12-2025','automático','Pedido de Expedição de Mandado de Levantamento Juntado Nº Protocolo: WPDR.25.70038440-0_x000D_
Tipo da Petição: Pedido de Expedição de Mandado de Levantamento_x000D_
Data: 08/12/2025 20:27','2025-12-12 13:50:47.539980','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(36,106,'05-12-2025','automático','Conclusos para Despacho','2025-12-12 13:50:47.540007','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(37,45,'05-12-2025','automático','Certidão de Cartório Expedida Certidão de Cartório - CUSTAS - Certidão de Inexistência de Custas e Arquivamento - Cível - 61615','2025-12-12 13:50:47.540041','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(38,11,'05-12-2025','automático','Suspensão do Prazo Prazo referente ao usuário foi alterado para 03/02/2026 devido à alteração da tabela de feriados_x000D_
Prazo referente ao usuário foi alterado para 29/01/2026 devido à alteração da tabela de feriados','2025-12-12 13:50:47.540068','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(39,86,'05-12-2025','automático','Certidão de Publicação Expedida Relação: 2253/2025_x000D_
Data da Publicação: 09/12/2025','2025-12-12 13:50:47.540096','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(40,78,'05-12-2025','automático','Ato Ordinatório - Intimação - DJE Aguardando apresentação de contrarrazões pela(s) parte(s) recorrida(s), no prazo de 15 (quinze) dias.','2025-12-12 13:50:47.540158','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(41,17,'05-12-2025','automático','Certidão de Publicação Expedida Relação: 1870/2025_x000D_
Data da Publicação: 09/12/2025','2025-12-12 13:50:47.540185','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(42,66,'05-12-2025','automático','Inclusão em Pauta Pauta Eletrônica: Início: 21/01/2026 - Término: 28/01/2026','2025-12-12 13:50:47.540212','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(43,99,'05-12-2025','automático','Certidão de Publicação Expedida Relação: 2370/2025_x000D_
Data da Publicação: 09/12/2025','2025-12-12 13:50:47.540275','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(44,50,'04-12-2025','automático','Trânsito em Julgado às partes - Proc. em Andamento Certidão - Trânsito em Julgado','2025-12-12 13:50:47.540303','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(45,75,'04-12-2025','automático','Trânsito em Julgado às partes - Proc. em Andamento Certidão - Trânsito em Julgado','2025-12-12 13:50:47.540329','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(46,87,'04-12-2025','automático','Despacho Vistos. Trata-se de recurso de apelação interposto pela parte autora contra sentença que julgou parcialmente procedentes os pedidos iniciais, limitando-se a condenar a parte ré ao pagamento de indenização por danos materiais decorrentes de vícios construtivos e rejeitando a pretensão de reparação por danos morais. Inconformada, a parte apelante pugna pela reforma da sentença, sob a alegação de que os vícios estruturais constatados no imóvel, ainda que corrigíveis, ultrapassam o âmbito do mero inadimplemento contratual e repercutem diretamente na esfera existencial do adquirente, comprometendo seu bem-estar, a tranquilidade familiar e a legítima expectativa depositada na aquisição da moradia própria. Sustenta que o laudo pericial, acompanhado de registro fotográfico, evidencia trincas, infiltrações e falhas de execução aptas a caracterizar efetivo abalo moral, razão pela qual requer a condenação da ré também ao pagamento de danos extrapatrimoniais. Observa-se às fls. 191 a 205 que a apelação delimita a insurgência exclusivamente ao capítulo da sentença que afastou o dano moral, sustentando que a gravidade dos vícios constatados e a frustração decorrente da aquisição de imóvel defeituoso configuram abalo moral indenizável. Registra-se, ademais, a apresentação de manifestação da parte ré às fls. 228/252, reiterada às fls. 258/282, bem como o pagamento voluntário da condenação material às fls. 253/254 e 283, ocasião em que pugna pela extinção da ação, reforçando a tese de inexistência de dano moral e de integral satisfação da obrigação reconhecida na sentença. Assim, manifeste-se a parte ativa/apelante no prazo de 5 (cinco) dias. Decorridos com ou sem manifestação, voltem conclusos para prosseguimento do julgamento. Intimem-se.','2025-12-12 13:50:47.540357','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(47,81,'04-12-2025','automático','Certidão de Publicação Expedida Relação: 1726/2025_x000D_
Data da Publicação: 05/12/2025','2025-12-12 13:50:47.540389','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(48,35,'04-12-2025','automático','Conclusos para Despacho','2025-12-12 13:50:47.540411','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(49,91,'03-12-2025','automático','Alteração de relator em cumprimento a despacho Magistrado de origem: Vaga - 5 / Valentino Aparecido de Andrade_x000D__x000D_Área de atuação do magistrado (origem): Ambas_x000D_Magistrado de destino: Vaga - 5 / Márcio Boscaro_x000D_Área de atuação do magistrado (destino): Ambas_x000D_Motivo: Dje de 27/11/2025: OPÇÃO do Desembargador MÁRCIO ANTONIO BOSCARO pela 28ª Câmara de Direito Privado, na cadeira anteriormente ocupada pela Desembargadora Teresa Cristina Motta Ramos Marques_x000D_
"Dje de 28/11/2025:  Dr. VALENTINO APARECIDO DE ANDRADE, JUIZ(A) DE DIREITO SUBSTITUTO(A) EM 2º GRAU, cessando a designação para 
responder pelo acervo e eventuais prevenções da Desa. Teresa Cristina Motta Ramos Marques (aposentada), na 28ª Câmara de Direito 
Privado a partir de 28/11/2025."_x000D_
M356936','2025-12-12 13:50:47.540432','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(50,48,'03-12-2025','automático','Expedido Termo Termo de Juntada - Automática','2025-12-12 13:50:47.540454','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(51,83,'03-12-2025','automático','Alteração de relator em cumprimento a despacho Magistrado de origem: Vaga - 4 / César Augusto Fernandes_x000D__x000D_Área de atuação do magistrado (origem): Ambas_x000D_Magistrado de destino: Vaga - 4 / Hertha Helena de Oliveira_x000D_Área de atuação do magistrado (destino): Ambas_x000D_Motivo: Dje de 27/11/2025:  PERMUTA solicitada pelo Desembargador CARLOS HENRIQUE MIGUEL TREVISAN (aposentado), com assento na 29ª Câmara de Direito Privado, e pela Desembargadora HERTHA HELENA ROLLEMBERG PADILHA DE OLIVEIRA, com assento na 24ª Câmara de Direito Privado, com efeitos a partir de 26/11/2025._x000D_
(m356936)','2025-12-12 13:50:47.540479','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(52,15,'03-12-2025','automático','Arquivado Definitivamente','2025-12-12 13:50:47.540513','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(53,70,'01-12-2025','automático','Certidão de Publicação Expedida Relação: 1671/2025_x000D_
Data da Publicação: 02/12/2025','2025-12-12 13:50:47.540536','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(54,16,'01-12-2025','automático','Certidão de Publicação Expedida Relação: 2016/2025_x000D_
Data da Publicação: 02/12/2025','2025-12-12 13:50:47.540556','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(55,80,'01-12-2025','automático','Expedido Certidão CERTIFICO que o v. Acórdão foi disponibilizado no Diário de Justiça Eletrônico Nacional - DJEN de hoje. Considera-se data da publicação o 1° dia útil subsequente.','2025-12-12 13:50:47.540587','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(56,77,'28-11-2025','automático','Petição Juntada Nº Protocolo: WPDR.25.70037597-4_x000D_
Tipo da Petição: Petições Diversas_x000D_
Data: 28/11/2025 13:39','2025-12-12 13:50:47.540610','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(57,47,'28-11-2025','automático','Processo encaminhado para o Magistrado','2025-12-12 13:50:47.540633','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(58,1,'26-11-2025','automático','Documento Juntado Nº Protocolo: FLEP.21.00000009-4_x000D_
Tipo da Petição: Certidão (Digitalizada)_x000D_
Data: 08/01/2021 14:45_x000D_
Complemento: Regularização de cadastro.','2025-12-12 13:50:47.540664','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(59,10,'25-11-2025','automático','Petição Juntada Nº Protocolo: WBRE.25.70289559-2_x000D_
Tipo da Petição: Petições Diversas_x000D_
Data: 25/11/2025 14:38','2025-12-12 13:50:47.540690','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(60,49,'24-11-2025','automático','Certidão de Cartório Expedida Certidão de Cartório - CUSTAS - Certidão de Inexistência de Custas e Arquivamento - Cível - 61615','2025-12-12 13:50:47.540714','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(61,14,'24-11-2025','automático','Pedido de Liminar/Tutela Antecipada Juntado Nº Protocolo: WVPT.25.70062696-9_x000D_
Tipo da Petição: Pedido de Liminar/Antecipação de Tutela_x000D_
Data: 24/11/2025 09:12','2025-12-12 13:50:47.540737','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(62,18,'20-11-2025','automático','Petição Juntada Nº Protocolo: WBRO.25.70024711-9_x000D_
Tipo da Petição: Petição Intermediária_x000D_
Data: 20/11/2025 09:27','2025-12-12 13:50:47.540760','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(63,93,'18-11-2025','automático','Certidão de Cartório Expedida Certidão de Cartório - CUSTAS - Certidão de Inexistência de Custas e Arquivamento - Cível - 61615','2025-12-12 13:50:47.540784','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(64,66,'17-11-2025','automático','Subprocesso Cadastrado Seq.: 50 - Embargos de Declaração Cível','2025-12-12 13:50:47.540806','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(65,9,'17-11-2025','automático','Ofício Juntado','2025-12-12 13:50:47.540829','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(66,79,'12-11-2025','automático','Ato Ordinatório - Intimação - Portal OFÍCIO DEFENSORIA - FL. 384.','2025-12-12 13:50:47.540853','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(67,47,'11-11-2025','automático','Certidão de Cartório Expedida Certidão - Remessa dos Autos à 2ª Instância - Art. 102 - NSCGJ','2025-12-12 13:50:47.540882','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(68,65,'10-11-2025','automático','Expedido Termo Termo de Juntada - Automática','2025-12-12 13:50:47.540907','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(69,58,'05-11-2025','automático','Expedido Certidão CERTIFICO que o v. Acórdão foi disponibilizado no Diário de Justiça Eletrônico Nacional - DJEN de hoje. Considera-se data da publicação o 1° dia útil subsequente.','2025-12-12 13:50:47.540929','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(70,45,'03-11-2025','automático','Expedido Certidão Certifico que o v. acórdão transitou em julgado em 25/10/2025','2025-12-12 13:50:47.540953','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(71,76,'30-10-2025','automático','Conclusos para Sentença','2025-12-12 13:50:47.540976','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(72,72,'29-10-2025','automático','Conclusos para Decisão','2025-12-12 13:50:47.540999','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(73,87,'29-10-2025','automático','Certidão de Publicação Expedida Relação: 1491/2025_x000D_
Data da Publicação: 30/10/2025','2025-12-12 13:50:47.541022','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(74,71,'28-10-2025','automático','Certidão de Cartório Expedida Certidão de Cartório - CUSTAS - Certidão de Pagamento de Custas e Arquivamento - Cível - 61615','2025-12-12 13:50:47.541044','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(75,82,'17-10-2025','automático','Autos no Prazo','2025-12-12 13:50:47.541077','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(76,60,'16-10-2025','automático','Processo encaminhado para a Coordenadoria da Seção','2025-12-12 13:50:47.541101','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(77,32,'12-10-2025','automático','Suspensão do Prazo Prazo referente ao usuário foi alterado para 17/11/2025 devido à alteração da tabela de feriados','2025-12-12 13:50:47.541123','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(78,100,'07-10-2025','automático','Certidão de Cartório Expedida Certidão de Cartório - CUSTAS - Certidão de Inexistência de Custas e Arquivamento - Cível - 61615','2025-12-12 13:50:47.541146','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(79,75,'03-10-2025','automático','Expedido Certidão Transito com V.O (monocrática)','2025-12-12 13:50:47.541169','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(80,96,'03-10-2025','automático','Documento Juntado','2025-12-12 13:50:47.541192','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(81,94,'03-10-2025','automático','Certidão de Trânsito em Julgado com Baixa Expedida Certidão - Trânsito em Julgado com Baixa - Processo Digital','2025-12-12 13:50:47.541215','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(82,93,'02-10-2025','automático','Expedido Certidão Certifico que o v. acórdão transitou em julgado em 19/09/2025.','2025-12-12 13:50:47.541237','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(83,57,'28-09-2025','automático','Suspensão do Prazo Prazo referente ao usuário foi alterado para 17/12/2025 devido à alteração da tabela de feriados','2025-12-12 13:50:47.541260','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(84,39,'28-09-2025','automático','Suspensão do Prazo Prazo referente ao usuário foi alterado para 17/12/2025 devido à alteração da tabela de feriados','2025-12-12 13:50:47.541283','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(85,50,'27-09-2025','automático','Expedido Certidão Certifico que o v. acórdão transitou em julgado em 17/09/2025.','2025-12-12 13:50:47.541315','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(86,23,'25-09-2025','automático','Documento Juntado','2025-12-12 13:50:47.541339','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(87,54,'24-09-2025','automático','Certidão de Cartório Expedida Certifico e dou fé que, após compulsar os presentes autos, verifiquei constar às fls. (345/347) o(s) comprovante(s) do pagamento integral das CUSTAS devidas e procedi ao seu arquivamento definitivo.','2025-12-12 13:50:47.541365','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(88,92,'12-09-2025','automático','Certidão de Cartório Expedida Certidão de Cartório - CUSTAS - Certidão de Pagamento de Custas e Arquivamento - Cível - 61615','2025-12-12 13:50:47.541397','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(89,89,'05-09-2025','automático','Certidão de Publicação Expedida Relação: 1135/2025_x000D_
Data da Publicação: 08/09/2025','2025-12-12 13:50:47.541421','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(90,104,'27-08-2025','automático','Certidão de Publicação Expedida Relação: 1509/2025_x000D_
Data da Publicação: 28/08/2025','2025-12-12 13:50:47.541444','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(91,60,'20-08-2025','automático','Subprocesso Unificado ao Principal','2025-12-12 13:50:47.541475','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(92,7,'20-08-2025','automático','Petição Juntada Nº Protocolo: WITU.25.80032814-5_x000D_
Tipo da Petição: Petições Diversas_x000D_
Data: 20/08/2025 16:56','2025-12-12 13:50:47.541499','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(93,4,'18-08-2025','automático','Ofício Expedido Ofício - Cancelamento da Certidão de Inscrição da Dívida - Taxa Judiciária - Comunicação Eletrônica PGE','2025-12-12 13:50:47.541532','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(94,84,'14-08-2025','automático','Certidão de Publicação Expedida Relação: 0866/2025_x000D_
Data da Publicação: 15/08/2025','2025-12-12 13:50:47.541568','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(95,68,'13-08-2025','automático','Certidão de Cartório Expedida Certidão de Cartório - CUSTAS - Certidão de Pagamento de Custas e Arquivamento - Cível - 61615','2025-12-12 13:50:47.541594','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(96,59,'13-08-2025','automático','Certidão de Cartório Expedida Certidão de Cartório - CUSTAS - Certidão de Pagamento de Custas e Arquivamento - Cível - 61615','2025-12-12 13:50:47.541618','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(97,58,'12-08-2025','automático','Certidão de Cartório Expedida Certifico e dou fé que, nos termos do art. 102, V, das Normas de Serviço da Corregedoria Geral da Justiça, inexiste mídia digital a ser encaminhada.','2025-12-12 13:50:47.541641','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(98,101,'12-08-2025','automático','Certidão de Cartório Expedida Certidão de Cartório - CUSTAS - Certidão de Pagamento de Custas e Arquivamento - Cível - 61615','2025-12-12 13:50:47.541676','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(99,61,'30-07-2025','automático','Certidão de Cartório Expedida Certidão de Cartório - CUSTAS - Certidão de Pagamento de Custas e Arquivamento - Cível - 61615','2025-12-12 13:50:47.541701','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(100,46,'23-07-2025','automático','Certidão de Cartório Expedida Certidão de Cartório - CUSTAS - Certidão de Inexistência de Custas e Arquivamento - Cível - 61615','2025-12-12 13:50:47.541727','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(101,102,'23-07-2025','automático','Certidão de Cartório Expedida Certidão de Cartório - CUSTAS - Certidão de Custas e Arquivamento - Cível - 61614','2025-12-12 13:50:47.541751','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(102,74,'21-07-2025','automático','Certidão de Cartório Expedida Certifico e dou fé que, após compulsar os presentes autos, verifiquei constar às fls. (338/339) o(s) comprovante(s) do pagamento integral das CUSTAS devidas e procedi ao seu arquivamento definitivo.','2025-12-12 13:50:47.541774','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(103,29,'14-07-2025','automático','Certidão de Cartório Expedida Certifico e dou fé que, após compulsar os presentes autos, verifiquei constar às fls. (67/68) o(s) comprovante(s) do pagamento integral das CUSTAS devidas e procedi ao seu arquivamento definitivo.','2025-12-12 13:50:47.541805','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(104,66,'10-07-2025','automático','Certidão de Cartório Expedida Certifico e dou fé que, nos termos do art. 102, V, das Normas de Serviço da Corregedoria Geral da Justiça, inexiste mídia digital a ser encaminhada.','2025-12-12 13:50:47.541829','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(105,49,'03-07-2025','automático','Trânsito em julgado Certifico que o v. acórdão transitou em julgado em 28.06.2025.','2025-12-12 13:50:47.541853','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(106,71,'30-06-2025','automático','Expedido Certidão Certifico que o v. acórdão transitou em julgado em 14/06/2025','2025-12-12 13:50:47.541884','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(107,24,'09-06-2025','automático','Certidão de Trânsito em Julgado com Baixa Expedida (R) Certidão automática - trânsito em julgado com arquivamento (já com a movimentação)','2025-12-12 13:50:47.541916','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(108,57,'09-06-2025','automático','Trânsito em julgado Certifico que o v. acórdão transitou em julgado em 03/06/2025.','2025-12-12 13:50:47.541941','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(109,54,'31-05-2025','automático','Baixa Definitiva','2025-12-12 13:50:47.541976','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(110,40,'30-05-2025','automático','Expedido Certidão Certifico que o v. acórdão transitou em julgado em 29/04/2025.','2025-12-12 13:50:47.542000','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(111,59,'28-05-2025','automático','Expedido Certidão Certifico que o v. acórdão transitou em julgado em 20 de maio de 2025.','2025-12-12 13:50:47.542051','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(112,41,'23-05-2025','automático','Arquivado Definitivamente Movimentação lançada de forma automática, nos termos do Comunicado Conjunto nº 385/2025.','2025-12-12 13:50:47.542077','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(113,53,'23-05-2025','automático','Arquivado Definitivamente Movimentação lançada de forma automática, nos termos do Comunicado Conjunto nº 385/2025.','2025-12-12 13:50:47.542100','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(114,95,'20-05-2025','automático','Certidão de Cartório Expedida Certidão de Cartório - CUSTAS - Certidão de Inexistência de Custas e Arquivamento - Cível - 61615','2025-12-12 13:50:47.542122','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(115,56,'11-05-2025','automático','Suspensão do Prazo Prazo referente ao usuário foi alterado para 28/04/2025 devido à alteração da tabela de feriados','2025-12-12 13:50:47.542145','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(116,48,'05-05-2025','automático','Documento Juntado','2025-12-12 13:50:47.542168','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(117,68,'25-04-2025','automático','Expedido Certidão Certifico que o v. acórdão transitou em julgado em 12/04/2025.','2025-12-12 13:50:47.542191','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(118,60,'24-04-2025','automático','Certidão de Cartório Expedida Certidão - Genérica','2025-12-12 13:50:47.542218','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(119,51,'22-04-2025','automático','Certidão de Cartório Expedida Certidão de Cartório - CUSTAS - Certidão de Inexistência de Custas e Arquivamento - Cível - 61615','2025-12-12 13:50:47.542248','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(120,6,'09-04-2025','automático','Arquivado Definitivamente','2025-12-12 13:50:47.542272','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(121,64,'07-04-2025','automático','Certidão de Cartório Expedida Certidão de Cartório - CUSTAS - Certidão de Pagamento de Custas e Arquivamento - Cível- 61614','2025-12-12 13:50:47.542295','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(122,41,'07-04-2025','automático','Expedido Certidão Certifico que, ante a petição de fls. 407/410 (comprovante de depósito), o v. acórdão transitou em julgado em 07/04/2025. Nada mais.','2025-12-12 13:50:47.542324','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(123,46,'26-03-2025','automático','Expedido Certidão Certifico que o v. acórdão transitou em julgado em 27 de fevereiro de 2025.','2025-12-12 13:50:47.542353','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(124,74,'12-03-2025','automático','Recebidos os Autos do Superior Tribunal de Justiça','2025-12-12 13:50:47.542406','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(125,103,'11-03-2025','automático','Trânsito em julgado transitou em julgado em 11.03.2025.','2025-12-12 13:50:47.542430','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(126,65,'06-03-2025','automático','Certidão de Cartório Expedida Certidão - Remessa dos Autos à 2ª Instância - Art. 102 - NSCGJ','2025-12-12 13:50:47.542453','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(127,55,'25-02-2025','automático','Execução/Cumprimento de Sentença Iniciada (o) 0000271-06.2025.8.26.0431 - Cumprimento de sentença','2025-12-12 13:50:47.542475','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(128,52,'18-02-2025','automático','Certidão de Cartório Expedida Certidão de Cartório - CUSTAS - Certidão de Pagamento de Custas e Arquivamento - Cível - 61615','2025-12-12 13:50:47.542503','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(129,101,'17-02-2025','automático','Trânsito em julgado Certifico que o v. acórdão transitou em julgado em 13/02/2025.','2025-12-12 13:50:47.542533','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(130,103,'13-02-2025','automático','Publicado em Disponibilizado em 12/02/2025_x000D_
Tipo de publicação: Intimação de Acórdão_x000D_
Número do Diário Eletrônico: 4143','2025-12-12 13:50:47.542557','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(131,103,'12-02-2025','automático','Expedido Certidão Certidão de Publicação de Acórdão [Digital]','2025-12-12 13:50:47.542580','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(132,25,'01-02-2025','automático','Certidão de Publicação Expedida Relação: 0086/2025_x000D_
Data da Publicação: 04/02/2025_x000D_
Número do Diário: 4136','2025-12-12 13:50:47.542629','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(133,42,'20-01-2025','automático','Remetidos os Autos para o Arquivo Geral – Devolução de Feitos Não Reativados','2025-12-12 13:50:47.542653','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(134,90,'16-01-2025','automático','Trânsito em julgado Transitou em Julgado em 19/12/2024','2025-12-12 13:50:47.542677','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(135,33,'08-01-2025','automático','Certidão de Cartório Expedida Certifico e dou fé que, após compulsar os presentes autos, verifiquei constar às fls. (475/476) o(s) comprovante(s) do pagamento integral das CUSTAS devidas e procedi ao seu arquivamento definitivo.','2025-12-12 13:50:47.542700','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(136,52,'19-12-2024','automático','Expedido Certidão Certifico que o v. acórdão transitou em julgado em 11/12/2024.','2025-12-12 13:50:47.542730','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(137,28,'10-12-2024','automático','Certidão de Cartório Expedida Certidão de Cartório - CUSTAS - Certidão de Pagamento de Custas e Arquivamento - Cível - 61615','2025-12-12 13:50:47.542755','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(138,69,'10-12-2024','automático','Certidão de Cartório Expedida Certidão de Cartório - CUSTAS - Certidão de Inexistência de Custas e Arquivamento - Cível - 61615','2025-12-12 13:50:47.542778','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(139,19,'06-12-2024','automático','Recebidos os Autos do Superior Tribunal de Justiça','2025-12-12 13:50:47.542801','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(140,38,'03-12-2024','automático','Certidão de Publicação Expedida Relação: 0962/2024_x000D_
Data da Publicação: 04/12/2024_x000D_
Número do Diário: 4104','2025-12-12 13:50:47.542824','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(141,103,'29-11-2024','automático','Expedido Certidão Certifico que há pedido de liminar/tutela antecipada no subprocesso encerrado nesta data.','2025-12-12 13:50:47.542853','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(142,103,'29-11-2024','automático','Subprocesso Unificado ao Principal','2025-12-12 13:50:47.542877','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(143,55,'21-11-2024','automático','Expedido Certidão Certifico que o v. acórdão transitou em julgado em 09/11/2024','2025-12-12 13:50:47.542900','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(144,37,'18-11-2024','automático','Trânsito em Julgado às partes - Proc. em Andamento Certifico e dou fé que a r.sentença de fls. 44, transitou em julgado em 22/10/2024.','2025-12-12 13:50:47.542922','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(145,5,'31-10-2024','automático','Certidão de Trânsito em Julgado com Baixa Expedida Trânsito em Julgado com Baixa - Processo Digital','2025-12-12 13:50:47.542948','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(146,36,'29-10-2024','automático','Suspensão do Prazo Prazo referente ao usuário foi alterado para 24/01/2025 devido à alteração da tabela de feriados','2025-12-12 13:50:47.542972','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(147,44,'11-10-2024','automático','Documento Juntado','2025-12-12 13:50:47.542998','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(148,8,'10-10-2024','automático','Trânsito em Julgado às partes - Proc. em Andamento Certifico e dou fé que a r. sentença supra transitou em julgado em 12/06/2024.','2025-12-12 13:50:47.543022','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(149,27,'02-10-2024','automático','Certidão de Cartório Expedida Certidão de Cartório - CUSTAS - Certidão de Pagamento de Custas e Arquivamento - Cível - 61615','2025-12-12 13:50:47.543048','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(150,33,'19-09-2024','automático','Decisão Digitalizada Sem complemento','2025-12-12 13:50:47.543075','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(151,22,'22-08-2024','automático','Execução/Cumprimento de Sentença Iniciada (o) 0004673-56.2024.8.26.0079 - Cumprimento de sentença','2025-12-12 13:50:47.543098','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(152,80,'22-08-2024','automático','Subprocesso Unificado ao Principal','2025-12-12 13:50:47.543128','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(153,63,'08-08-2024','automático','Recebidos os Autos do Superior Tribunal de Justiça','2025-12-12 13:50:47.543153','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(154,36,'07-08-2024','automático','Recebidos os Autos do Superior Tribunal de Justiça','2025-12-12 13:50:47.543177','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(155,30,'27-07-2024','automático','Certidão de Cartório Expedida Certidão de Cartório - CUSTAS - Certidão de Pagamento de Custas e Arquivamento - Cível - 61615','2025-12-12 13:50:47.543203','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(156,28,'04-07-2024','automático','Recebidos os Autos do Superior Tribunal de Justiça','2025-12-12 13:50:47.543227','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(157,85,'26-06-2024','automático','Certidão de Cartório Expedida Certidão de Cartório - CUSTAS - Certidão de Pagamento de Custas e Arquivamento - Cível - 61615','2025-12-12 13:50:47.543250','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(158,43,'19-06-2024','automático','Baixa Definitiva','2025-12-12 13:50:47.543273','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(159,13,'02-06-2024','automático','Petição Juntada Nº Protocolo: WBRE.24.70111073-6_x000D_
Tipo da Petição: Petição Intermediária_x000D_
Data: 02/06/2024 08:14','2025-12-12 13:50:47.543295','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(160,80,'15-04-2024','automático','Execução/Cumprimento de Sentença Iniciada (o) 0001065-68.2024.8.26.0073 - Cumprimento de sentença','2025-12-12 13:50:47.543318','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(161,31,'05-02-2024','automático','Execução/Cumprimento de Sentença Iniciada (o) 0000216-37.2024.8.26.0319 - Cumprimento Provisório de Sentença','2025-12-12 13:50:47.543341','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(162,3,'31-08-2023','automático','Remetido ao DJE Relação: 0677/2023_x000D_
Teor do ato: Advogado do(a) requerido: providencie a impressão do(a) certidão de honorários de fls. 297, assinado(a) digitalmente, que se encontra disponibilizada no sítio do Tribunal de Justiça do Estado de São Paulo sistema ESAJ. Prazo: 10 (dez) dias._x000D_
Advogados(s): Rogerio do Amaral (OAB 150251/SP), Cid Carlos de Freitas (OAB 231735/SP), Kleber Giacomini (OAB 235027/SP), Marco Andre Mantovan (OAB 269237/SP), Lucas Machado Arroyo (OAB 320696/SP), Leunice Amaral de Jesus (OAB 361150/SP), Valmir Amaral de Jesus (OAB 416931/SP)','2025-12-12 13:50:47.543375','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(163,26,'20-04-2023','automático','Certidão de Cartório Expedida Certifico e dou fé que decorreu o prazo legal sem demais manifestações da parte interessada.','2025-12-12 13:50:47.543411','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(164,62,'20-01-2023','automático','Certidão de Cartório Expedida Certidão de Cartório - CUSTAS - Certidão de Pagamento de Custas e Arquivamento - Cível - 61615','2025-12-12 13:50:47.543439','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(165,20,'18-02-2022','automático','Certidão de Cartório Expedida Certidão de Cartório - CUSTAS - Certidão de Pagamento de Custas e Arquivamento - Cível - 61615','2025-12-12 13:50:47.543463','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(166,12,'02-03-2021','automático','Arquivado Definitivamente','2025-12-12 13:50:47.543489','tjsp','2025-12-12 13:50:47');
INSERT INTO "andamentos" VALUES(167,2,'09-06-2015','automático','Certidão de Publicação Expedida Relação :0035/2013_x000D_
Data da Disponibilização: 03/10/2013_x000D_
Data da Publicação: 04/10/2013_x000D_
Número do Diário: _x000D_
Página:','2025-12-12 13:50:47.543513','tjsp','2025-12-12 13:50:47');
CREATE TABLE arquivos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    processo_id INTEGER NOT NULL,
    
    nome_arquivo TEXT NOT NULL,
    caminho_arquivo TEXT NOT NULL,
    tipo_arquivo TEXT,
    tamanho_bytes INTEGER,
    
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (processo_id) REFERENCES processos(id) ON DELETE CASCADE
);
CREATE TABLE auditoria (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    
    processo_id INTEGER,
    
    tipo_evento TEXT NOT NULL CHECK(tipo_evento IN 
        ('criado', 'modificado', 'status_mudou', 'prazo_adicionado', 
         'andamento_adicionado', 'arquivo_adicionado', 'deletado', 'restaurado')),
    
    tabela_afetada TEXT,
    registro_id INTEGER,
    
    usuario TEXT NOT NULL DEFAULT 'sistema',
    valor_anterior TEXT,
    valor_novo TEXT,
    detalhes TEXT,
    
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (processo_id) REFERENCES processos(id)
);
INSERT INTO "auditoria" VALUES(1,1,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 0004736-36.2007.8.26.0319 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(2,2,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 0000386-73.2005.8.26.0319 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(3,3,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1000095-60.2022.8.26.0319 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(4,4,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1500764-72.2018.8.26.0068 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(5,5,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1003851-50.2024.8.26.0079 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(6,6,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1505268-20.2020.8.26.0079 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(7,7,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1503425-44.2021.8.26.0286 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(8,8,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 0001483-78.2023.8.26.0319 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(9,9,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 0007229-31.2005.8.26.0068 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(10,10,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1010657-52.2015.8.26.0068 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(11,11,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 0017930-96.2020.8.26.0562 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(12,12,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1015501-18.2015.8.26.0562 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(13,13,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1003238-39.2019.8.26.0068 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(14,14,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 0001151-78.2020.8.26.0655 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(15,15,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 0005341-07.2008.8.26.0655 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(16,16,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1002924-49.2017.8.26.0655 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(17,17,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1002984-80.2021.8.26.0655 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(18,18,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1002131-15.2015.8.26.0095 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(19,19,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 2070747-04.2024.8.26.0000 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(20,20,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1002677-95.2016.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(21,21,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 0001176-50.2021.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(22,22,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1006788-43.2018.8.26.0079 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(23,23,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 0004673-56.2024.8.26.0079 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(24,24,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 0004291-63.2024.8.26.0079 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(25,25,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 0061987-67.2019.8.26.0100 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(26,26,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1028974-60.2019.8.26.0100 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(27,27,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1001324-15.2019.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(28,28,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1001044-44.2019.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(29,29,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 0001089-89.2024.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(30,30,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1002345-37.2020.8.26.0319 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(31,31,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1002301-18.2020.8.26.0319 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(32,32,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 0000216-37.2024.8.26.0319 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(33,33,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1001618-33.2020.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(34,34,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1009461-41.2021.8.26.0002 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(35,35,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1064673-13.2022.8.26.0002 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(36,36,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1002269-65.2020.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(37,37,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 0001256-09.2024.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(38,38,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1000184-72.2021.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(39,39,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 0000217-74.2024.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(40,40,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 2366575-43.2024.8.26.0000 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(41,41,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1000883-63.2021.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(42,42,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1002524-27.2021.8.26.0483 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(43,43,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1002220-24.2020.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(44,44,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 0001258-76.2024.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(45,45,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1001847-56.2021.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(46,46,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1001835-79.2021.8.26.0063 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(47,47,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1000393-07.2022.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(48,48,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1000394-89.2022.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(49,49,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1000395-74.2022.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(50,50,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1000468-46.2022.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(51,51,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 0000067-59.2025.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(52,52,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1000477-08.2022.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(53,53,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1000478-90.2022.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(54,54,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1000479-75.2022.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(55,55,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1000494-44.2022.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(56,56,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 0000271-06.2025.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(57,57,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1000537-78.2022.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(58,58,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1000630-41.2022.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(59,59,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1000643-40.2022.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(60,60,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1000823-56.2022.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(61,61,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 0043808-80.2022.8.26.0100 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(62,62,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1045001-16.2022.8.26.0100 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(63,63,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 2096219-41.2023.8.26.0000 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(64,64,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 0058568-63.2024.8.26.0100 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(65,65,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1000832-18.2022.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(66,66,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1000970-82.2022.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(67,67,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1002241-87.2022.8.26.0347 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(68,68,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1001050-46.2022.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(69,69,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1001078-14.2022.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(70,70,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1001160-45.2022.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(71,71,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1001244-46.2022.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(72,72,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 0001002-02.2025.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(73,73,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1001135-58.2022.8.26.0584 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(74,74,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1001359-67.2022.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(75,75,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1000766-38.2022.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(76,76,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1000262-61.2024.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(77,77,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1001343-16.2022.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(78,78,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1001676-65.2022.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(79,79,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1001813-47.2022.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(80,80,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1000565-19.2023.8.26.0073 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(81,81,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 0001065-68.2024.8.26.0073 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(82,82,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1000564-34.2023.8.26.0073 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(83,83,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 2223759-04.2025.8.26.0000 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(84,84,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1000470-98.2022.8.26.0145 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(85,85,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1004151-05.2023.8.26.0319 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(86,86,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1172104-69.2023.8.26.0100 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(87,87,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1000004-51.2024.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(88,88,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1000419-34.2024.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(89,89,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1001538-37.2024.8.26.0073 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(90,90,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 2197849-09.2024.8.26.0000 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(91,91,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 2248817-09.2025.8.26.0000 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(92,92,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1005532-16.2024.8.26.0286 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(93,93,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1005020-33.2024.8.26.0286 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(94,94,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1004869-67.2024.8.26.0286 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(95,95,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1001816-31.2024.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(96,96,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1002234-66.2024.8.26.0431 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(97,97,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1011437-02.2024.8.26.0286 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(98,98,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1503193-84.2024.8.26.0073 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(99,99,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1198425-10.2024.8.26.0100 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(100,100,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1010877-57.2025.8.26.0405 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(101,101,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1033309-83.2023.8.26.0003 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(102,102,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 0007490-30.2024.8.26.0003 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(103,103,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 2234434-60.2024.8.26.0000 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(104,104,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 0003199-50.2025.8.26.0003 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(105,105,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1003453-96.2023.8.26.0319 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(106,106,'criado','processos',NULL,'migração_excel',NULL,NULL,'Processo 1002875-58.2025.8.26.0483 migrado do Excel','2025-12-12 13:50:47');
INSERT INTO "auditoria" VALUES(107,11,'status_mudou','processos',NULL,'api','status_anterior','urgente','Status alterado via API para urgente','2025-12-12 14:40:25');
INSERT INTO "auditoria" VALUES(108,11,'status_mudou','processos',NULL,'api','status_anterior','urgente','Status alterado via API para urgente','2025-12-12 14:40:27');
INSERT INTO "auditoria" VALUES(109,11,'status_mudou','processos',NULL,'api','status_anterior','andamento','Status alterado via API para andamento','2025-12-12 14:40:29');
INSERT INTO "auditoria" VALUES(110,2,'status_mudou','processos',NULL,'api','status_anterior','espera','Status alterado via API para espera','2025-12-12 14:40:49');
INSERT INTO "auditoria" VALUES(111,3,'status_mudou','processos',NULL,'api','status_anterior','espera','Status alterado via API para espera','2025-12-12 14:41:03');
INSERT INTO "auditoria" VALUES(112,4,'status_mudou','processos',NULL,'api','status_anterior','andamento','Status alterado via API para andamento','2025-12-12 14:41:16');
INSERT INTO "auditoria" VALUES(113,4,'status_mudou','processos',NULL,'api','status_anterior','espera','Status alterado via API para espera','2025-12-12 14:41:23');
INSERT INTO "auditoria" VALUES(114,12,'status_mudou','processos',NULL,'api','status_anterior','espera','Status alterado via API para espera','2025-12-12 14:41:46');
INSERT INTO "auditoria" VALUES(115,5,'status_mudou','processos',NULL,'api','status_anterior','espera','Status alterado via API para espera','2025-12-12 14:42:05');
INSERT INTO "auditoria" VALUES(116,6,'status_mudou','processos',NULL,'api','status_anterior','espera','Status alterado via API para espera','2025-12-12 14:42:21');
CREATE TABLE configuracoes (
    chave TEXT PRIMARY KEY,
    valor TEXT,
    tipo TEXT,
    descricao TEXT,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "configuracoes" VALUES('advogado_nome','Cid Freitas','string','Nome do advogado','2025-12-12 18:54:30');
INSERT INTO "configuracoes" VALUES('advogado_oab','','string','OAB do advogado','2025-12-12 18:54:30');
INSERT INTO "configuracoes" VALUES('email_alertas','cidfreitas@hotmail.com','string','Email para alertas','2025-12-12 18:54:30');
INSERT INTO "configuracoes" VALUES('dias_alerta_critico','3','integer','Dias antes do prazo para alertar','2025-12-12 18:54:30');
INSERT INTO "configuracoes" VALUES('dias_alerta_warning','7','integer','Dias antes do prazo para alertar','2025-12-12 18:54:30');
INSERT INTO "configuracoes" VALUES('scraper_ultima_execucao','','datetime','Última execução scraper','2025-12-12 18:54:30');
INSERT INTO "configuracoes" VALUES('backup_ultimo','','datetime','Último backup','2025-12-12 18:54:30');
CREATE TABLE prazos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    processo_id INTEGER NOT NULL,
    
    tipo_prazo TEXT NOT NULL,
    descricao TEXT,
    data_vencimento DATE NOT NULL,
    dias_restantes INTEGER,
    
    status TEXT DEFAULT 'aberto' CHECK(status IN ('aberto', 'vencido', 'cumprido', 'prorrogado')),
    
    alerta_enviado BOOLEAN DEFAULT 0,
    data_alerta TIMESTAMP,
    
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_modificacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (processo_id) REFERENCES processos(id) ON DELETE CASCADE
);
INSERT INTO "prazos" VALUES(1,1,'resposta','Prazo para responder','2025-12-11',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(2,2,'resposta','Prazo para responder','2015-06-24',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(3,3,'resposta','Prazo para responder','2023-09-15',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(4,4,'resposta','Prazo para responder','2025-09-02',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(5,5,'resposta','Prazo para responder','2024-11-15',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(6,6,'resposta','Prazo para responder','2025-04-24',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(7,7,'resposta','Prazo para responder','2025-09-04',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(8,8,'resposta','Prazo para responder','2024-10-25',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(9,9,'resposta','Prazo para responder','2025-12-02',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(10,10,'resposta','Prazo para responder','2025-12-10',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(11,11,'resposta','Prazo para responder','2025-12-20',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(12,12,'resposta','Prazo para responder','2021-03-17',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(13,13,'resposta','Prazo para responder','2024-06-17',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(14,14,'resposta','Prazo para responder','2025-12-09',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(15,15,'resposta','Prazo para responder','2025-12-18',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(16,16,'resposta','Prazo para responder','2025-12-16',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(17,17,'resposta','Prazo para responder','2025-12-20',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(18,18,'resposta','Prazo para responder','2025-12-05',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(19,19,'resposta','Prazo para responder','2024-12-21',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(20,20,'resposta','Prazo para responder','2022-03-05',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(21,21,'resposta','Prazo para responder','2025-12-23',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(22,22,'resposta','Prazo para responder','2024-09-06',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(23,23,'resposta','Prazo para responder','2025-10-10',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(24,24,'resposta','Prazo para responder','2025-06-24',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(25,25,'resposta','Prazo para responder','2025-02-16',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(26,26,'resposta','Prazo para responder','2023-05-05',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(27,27,'resposta','Prazo para responder','2024-10-17',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(28,28,'resposta','Prazo para responder','2024-07-19',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(29,29,'resposta','Prazo para responder','2025-07-29',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(30,30,'resposta','Prazo para responder','2024-08-11',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(31,31,'resposta','Prazo para responder','2024-02-20',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(32,32,'resposta','Prazo para responder','2025-10-27',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(33,33,'resposta','Prazo para responder','2024-10-04',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(34,35,'resposta','Prazo para responder','2025-12-19',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(35,36,'resposta','Prazo para responder','2024-08-22',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(36,37,'resposta','Prazo para responder','2024-12-03',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(37,38,'resposta','Prazo para responder','2024-12-18',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(38,39,'resposta','Prazo para responder','2025-10-13',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(39,40,'resposta','Prazo para responder','2025-06-14',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(40,41,'resposta','Prazo para responder','2025-04-22',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(41,42,'resposta','Prazo para responder','2025-02-04',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(42,43,'resposta','Prazo para responder','2024-07-04',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(43,44,'resposta','Prazo para responder','2024-10-26',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(44,45,'resposta','Prazo para responder','2025-11-18',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(45,46,'resposta','Prazo para responder','2025-04-10',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(46,47,'resposta','Prazo para responder','2025-11-26',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(47,48,'resposta','Prazo para responder','2025-05-20',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(48,49,'resposta','Prazo para responder','2025-07-18',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(49,50,'resposta','Prazo para responder','2025-10-12',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(50,51,'resposta','Prazo para responder','2025-05-07',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(51,52,'resposta','Prazo para responder','2025-01-03',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(52,53,'resposta','Prazo para responder','2025-06-07',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(53,54,'resposta','Prazo para responder','2025-06-15',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(54,55,'resposta','Prazo para responder','2024-12-06',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(55,56,'resposta','Prazo para responder','2025-05-26',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(56,57,'resposta','Prazo para responder','2025-06-24',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(57,58,'resposta','Prazo para responder','2025-08-27',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(58,59,'resposta','Prazo para responder','2025-06-12',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(59,60,'resposta','Prazo para responder','2025-05-09',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(60,61,'resposta','Prazo para responder','2025-08-14',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(61,62,'resposta','Prazo para responder','2023-02-04',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(62,63,'resposta','Prazo para responder','2024-08-23',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(63,64,'resposta','Prazo para responder','2025-04-22',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(64,65,'resposta','Prazo para responder','2025-03-21',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(65,66,'resposta','Prazo para responder','2025-07-25',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(66,68,'resposta','Prazo para responder','2025-05-10',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(67,69,'resposta','Prazo para responder','2024-12-25',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(68,70,'resposta','Prazo para responder','2025-12-16',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(69,71,'resposta','Prazo para responder','2025-07-15',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(70,72,'resposta','Prazo para responder','2025-11-13',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(71,74,'resposta','Prazo para responder','2025-03-27',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(72,75,'resposta','Prazo para responder','2025-10-18',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(73,76,'resposta','Prazo para responder','2025-11-14',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(74,77,'resposta','Prazo para responder','2025-12-13',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(75,78,'resposta','Prazo para responder','2025-12-20',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(76,79,'resposta','Prazo para responder','2025-11-27',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(77,80,'resposta','Prazo para responder','2024-04-30',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(78,81,'resposta','Prazo para responder','2025-12-19',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(79,82,'resposta','Prazo para responder','2025-11-01',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(80,83,'resposta','Prazo para responder','2025-12-18',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(81,84,'resposta','Prazo para responder','2025-08-29',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(82,85,'resposta','Prazo para responder','2024-07-11',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(83,86,'resposta','Prazo para responder','2025-12-20',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(84,87,'resposta','Prazo para responder','2025-11-13',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(85,88,'resposta','Prazo para responder','2025-12-23',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(86,89,'resposta','Prazo para responder','2025-09-20',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(87,90,'resposta','Prazo para responder','2025-01-31',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(88,91,'resposta','Prazo para responder','2025-12-18',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(89,92,'resposta','Prazo para responder','2025-09-27',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(90,93,'resposta','Prazo para responder','2025-10-17',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(91,94,'resposta','Prazo para responder','2025-10-18',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(92,95,'resposta','Prazo para responder','2025-06-04',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(93,96,'resposta','Prazo para responder','2025-10-18',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(94,97,'resposta','Prazo para responder','2025-12-23',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(95,99,'resposta','Prazo para responder','2025-12-20',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(96,100,'resposta','Prazo para responder','2025-10-22',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(97,101,'resposta','Prazo para responder','2025-03-04',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(98,102,'resposta','Prazo para responder','2025-08-07',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(99,103,'resposta','Prazo para responder','2024-12-14',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(100,104,'resposta','Prazo para responder','2025-09-11',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
INSERT INTO "prazos" VALUES(101,106,'resposta','Prazo para responder','2025-12-20',NULL,'aberto',0,NULL,'2025-12-12 13:50:47','2025-12-12 13:50:47');
CREATE TABLE processos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cnj TEXT UNIQUE NOT NULL,
    tipo_processo TEXT NOT NULL CHECK(tipo_processo IN ('principal', 'apelacao', 'resp', 'agravo', 'embargo')),
    status TEXT NOT NULL CHECK(status IN ('urgente', 'andamento', 'espera', 'novo', 'arquivado')),
    
    processo_principal_id INTEGER,
    tipo_relacao TEXT CHECK(tipo_relacao IN ('agravo_de', 'embargo_de', 'apelacao_de', 'resp_de', 'recurso_de')),
    
    tribunal TEXT NOT NULL CHECK(tribunal IN ('1ª Instância', 'TJSP', 'STJ', 'STF')),
    foro TEXT,
    vara TEXT,
    
    parte_principal TEXT NOT NULL,
    parte_adversa TEXT,
    
    codigo_primeira_instancia TEXT,
    codigo_segunda_instancia TEXT,
    
    pasta_sistema TEXT NOT NULL,
    
    data_ajuizamento DATE,
    data_distribuicao DATE,
    ultimo_andamento_data DATE,
    proximo_prazo_data DATE,
    dias_para_prazo INTEGER,
    
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_modificacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario_criacao TEXT DEFAULT 'sistema',
    
    FOREIGN KEY (processo_principal_id) REFERENCES processos(id)
);
INSERT INTO "processos" VALUES(1,'0004736-36.2007.8.26.0319','principal','espera',NULL,NULL,'1ª Instância',NULL,NULL,'Cid Carlos de Freitas','Invtante Fábio Borges Boso, Herdeiro Marcos Boso, Invtardo Delfino Boso, Interesdo. Benedito de Oliveira Lima Neto, Credor Freitas Martinho Mesquita Advogados e Frederico de Ávila Miguel, TerIntCer Auto Posto Avenida de Lençóis Paulista Ltda','8VZ0703NK0000',NULL,'Boso',NULL,NULL,'26-11-2025',NULL,3,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(2,'0000386-73.2005.8.26.0319','principal','espera',NULL,NULL,'1ª Instância',NULL,NULL,'Borborema Empreendimentos Imobiliários','Reqte Construtora Marimbondo Ltda, Reqdo Carlos Rodrigo Oliveira Antonello','8VZ0500AQ0000',NULL,'CM despejo',NULL,NULL,'09-06-2015',NULL,1,'2025-12-12 13:50:47','2025-12-12 14:40:49','migração_excel');
INSERT INTO "processos" VALUES(3,'1000095-60.2022.8.26.0319','principal','espera',NULL,NULL,'1ª Instância',NULL,NULL,'Construtora Marimbondo','Reqte CSB Prime Empreendimentos Imobiliários Ltda., Reqda Chrislany Darke Barbosa Cruzeiro','8V00029EH0000',NULL,'csb',NULL,NULL,'31-08-2023',NULL,1,'2025-12-12 13:50:47','2025-12-12 14:41:03','migração_excel');
INSERT INTO "processos" VALUES(4,'1500764-72.2018.8.26.0068','principal','espera',NULL,NULL,'1ª Instância',NULL,NULL,'Val Paraiso Empreendimentos','Exeqte PREFEITURA MUNICIPAL DE BARUERI, Exectdo Cid Carlos de Freitas','1W0017H9A0000',NULL,'DivAtiva',NULL,NULL,'18-08-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 14:41:23','migração_excel');
INSERT INTO "processos" VALUES(5,'1003851-50.2024.8.26.0079','principal','espera',NULL,NULL,'1ª Instância',NULL,NULL,'Kleber Giacomini','Embargte Elianka Empreendimentos Imobiliarios Ltda, Embargdo MUNICÍPIO DE BOTUCATU','2700084RC0000',NULL,'Elianka',NULL,NULL,'31-10-2024',NULL,1,'2025-12-12 13:50:47','2025-12-12 14:42:05','migração_excel');
INSERT INTO "processos" VALUES(6,'1505268-20.2020.8.26.0079','principal','espera',NULL,NULL,'1ª Instância',NULL,NULL,'Karina Coe Razuk','Exeqte Prefeitura Municipal de Botucatu, Exectda Elianka Empreendimentos Imobiliarios Ltda','2700051MN0000',NULL,'Elianka',NULL,NULL,'09-04-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 14:42:21','migração_excel');
INSERT INTO "processos" VALUES(7,'1503425-44.2021.8.26.0286','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'Elianka Empreendimentos Imobiliarios','Exeqte Município de Itu, Exectdo Boncompagni Empreendimentos Imobiliários Ltda','7Y00087NQ0000',NULL,'ExecFiscal',NULL,NULL,'20-08-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(8,'0001483-78.2023.8.26.0319','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'Boncompagni Empreendimentos','Exeqte Condominio Residencial Jacaranda, Exectdo Construtora Marimbondo Ltda.','8V0002NNK0000',NULL,'jacaranda',NULL,NULL,'10-10-2024',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(9,'0007229-31.2005.8.26.0068','principal','espera',NULL,NULL,'1ª Instância',NULL,NULL,'Marcos Momo','Reqte Cid Carlos de Freitas, Reqdo Aquilino Ernesto Tito Yanez Pujol','1WZ0TT8150000',NULL,'P000106',NULL,NULL,'17-11-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(10,'1010657-52.2015.8.26.0068','principal','espera',NULL,NULL,'1ª Instância',NULL,NULL,'Gerson Edmundo Menghin','Exeqte Sociedade Aldeia da Serra Residencial Morada dos Pássaros, Exectdo Alexandre Muradas Ruffo, ArremTerc Walter Alves Manfredini, Interesdo. Cid Carlos de Freitas, TerIntCer Fundação Armando Alvares Penteado','1W00145HA0001',NULL,'P000106',NULL,NULL,'25-11-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(11,'0017930-96.2020.8.26.0562','principal','andamento',NULL,NULL,'1ª Instância',NULL,NULL,'CSB Prime Empreendimentos','Exeqte Aquilino Ernesto Tito Yanez Pujol, Exectdo Alexandre Muradas Ruffo, Interesdo. Claudia Regina Moreira Vasconcellos Ruffo, Interessado CID CARLOS DE FREITAS','FM000M19I0000',NULL,'P000106',NULL,NULL,'05-12-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 14:40:29','migração_excel');
INSERT INTO "processos" VALUES(12,'1015501-18.2015.8.26.0562','principal','espera',NULL,NULL,'1ª Instância',NULL,NULL,'Darlan Carneiro da Silva','Reqte Aquilino Ernesto Tito Yanez Pujol, Reqdo Alexandre Muradas Ruffo, Interesdo. Claudia Regina Moreira Vasconcellos Ruffo','FM000361G0000',NULL,'P000106',NULL,NULL,'02-03-2021',NULL,1,'2025-12-12 13:50:47','2025-12-12 14:41:46','migração_excel');
INSERT INTO "processos" VALUES(13,'1003238-39.2019.8.26.0068','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Embargte Aquilino Ernesto Tito Yanez Pujol, Embargdo Cid Carlos de Freitas','1W0018GI00000',NULL,'P000106',NULL,NULL,'02-06-2024',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(14,'0001151-78.2020.8.26.0655','principal','espera',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Exeqte Construtora Marimbondo Ltda, Exectdo Durvalino Roque Aizza','I70002G5U0000',NULL,'P000203',NULL,NULL,'24-11-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(15,'0005341-07.2008.8.26.0655','principal','andamento',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Construtora Marimbondo Ltda, Reqdo Durvalino Roque Aizza','I7ZX7IIU50000',NULL,'P000203',NULL,NULL,'03-12-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(16,'1002924-49.2017.8.26.0655','principal','espera',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Ministério Público do Estado de São Paulo, Reqdo Eduardo Tadeu Pereira','I700018WK0000',NULL,'P000203Mp',NULL,NULL,'01-12-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(17,'1002984-80.2021.8.26.0655','principal','andamento',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Marcio Correia Cazzamatta, Reqdo Durvalino Roque Aizza, Perito Cecilia Itapura de Miranda','I70002T7T0000',NULL,'P000203X',NULL,NULL,'05-12-2025',NULL,2,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(18,'1002131-15.2015.8.26.0095','principal','espera',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Pedro Henrique Fabiano Neto, Reqdo Prefeitura Municpal de Torrinha','2N0000AEV0000',NULL,'P001197',NULL,NULL,'20-11-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(19,'2070747-04.2024.8.26.0000','apelacao','novo',20,'recurso_de','1ª Instância',NULL,NULL,'N/A','Agravante: Construtora Marimbondo Ltda., Agravado: Denilson José dos Santos Garcia',NULL,'RI007Z6IC0000','P001201',NULL,NULL,'06-12-2024',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(20,'1002677-95.2016.8.26.0431','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Denilson José dos Santos Garcia, Reqdo Construtora Marimbondo Ltda., Perito LUIZ CARLOS ESPANHOL','BZ0000K3Q0000',NULL,'P001201',NULL,NULL,'18-02-2022',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(21,'0001176-50.2021.8.26.0431','principal','andamento',20,'apelacao_de','1ª Instância',NULL,NULL,'N/A','Exeqte Denilson José dos Santos Garcia, Exectdo Construtora Marimbondo Ltda., Perito Mário Miranda','BZ0001RYC0000',NULL,'P001201',NULL,NULL,'08-12-2025',NULL,3,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(22,'1006788-43.2018.8.26.0079','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Terezinha de Fatima Silva, Reqdo Construtora Marimbondo Ltda, Perito RAFAEL BALDINI DORICO','270003NG10000',NULL,'P001224',NULL,NULL,'22-08-2024',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(23,'0004673-56.2024.8.26.0079','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Exeqte Giseli Verônica Pires, Exectdo Construtora Marimbondo Ltda.','270008AT90000',NULL,'P001224',NULL,NULL,'25-09-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(24,'0004291-63.2024.8.26.0079','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Exeqte Terezinha de Fatima Silva, Exectdo Construtora Marimbondo Ltda','2700089SV0000',NULL,'P001224',NULL,NULL,'09-06-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(25,'0061987-67.2019.8.26.0100','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Exeqte Karina Coe Razuk, Exectdo Leida Regina de Oliveira Me, TerIntCer Cleusa Maria de Oliveira, Gestor Marilaine Boreges de Paula','2S0014AU30000',NULL,'P001229',NULL,NULL,'01-02-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(26,'1028974-60.2019.8.26.0100','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Karina Coe Razuk, Reqdo Leida Regina de Oliveira Me','2S00110120000',NULL,'P001229',NULL,NULL,'20-04-2023',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(27,'1001324-15.2019.8.26.0431','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Antonio Carlos Guerra Paixão, Reqdo Construtora Marimbondo Ltda., Perito LUIZ CARLOS ESPANHOL','BZ0001EAC0000',NULL,'P001233',NULL,NULL,'02-10-2024',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(28,'1001044-44.2019.8.26.0431','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Tereza de Fatima Gallis, Reqdo Construtora Marimbondo Ltda, Perito Luiz Carlos Espanhol',NULL,'RI007CKQG0000','P001234',NULL,NULL,'04-07-2024',NULL,2,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(29,'0001089-89.2024.8.26.0431','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Exeqte Tereza de Fatima Gallis, Exectdo Construtora Marimbondo Ltda','BZ000299A0000',NULL,'P001234',NULL,NULL,'14-07-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(30,'1002345-37.2020.8.26.0319','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Construtora Marimbondo Ltda., Reqdo Condominio Residencial Jacaranda','8V0001XDX0000',NULL,'P001238',NULL,NULL,'27-07-2024',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(31,'1002301-18.2020.8.26.0319','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Condominio Residencial Jacarandá, Reqdo Construtora Marimbondo Ltda, Confte Tabular Renato Trecenti, Interesda. Fazenda Pública do Estado de São Paulo','8V0001XBT0000',NULL,'P001239',NULL,NULL,'05-02-2024',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(32,'0000216-37.2024.8.26.0319','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Condominio Residencial Jacarandá, Reqdo Construtora Marimbondo Ltda','8V0002R2G0000',NULL,'P001239',NULL,NULL,'12-10-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(33,'1001618-33.2020.8.26.0431','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Jair Pereira dos Santos, Reqdo Construtora Marimbondo Ltda, Perito LUIZ CARLOS ESPANHOL','BZ0001N4N0000','RI007CQZS0000','P001240',NULL,NULL,'19-09-2024',NULL,2,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(34,'1009461-41.2021.8.26.0002','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','N/A','020025EAV0000',NULL,'P001242',NULL,NULL,NULL,NULL,0,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(35,'1064673-13.2022.8.26.0002','principal','andamento',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Gerson Edmundo Menghini, Reqdo Andreia Branca Menghini, Perito Fernando Costa Junior','02002CC4C0000',NULL,'P001242',NULL,NULL,'04-12-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(36,'1002269-65.2020.8.26.0431','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Alexandre Renno Terenciani, Reqdo Construtora Marimbondo Ltda, Perito LUIZ CARLOS ESPANHOL','BZ0001OOR0000','RI007RIV80000','P001244',NULL,NULL,'07-08-2024',NULL,2,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(37,'0001256-09.2024.8.26.0431','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Exeqte Alexandre Renno Terenciani, Exectdo Construtora Marimbondo Ltda','BZ00029OV0000',NULL,'P001244',NULL,NULL,'18-11-2024',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(38,'1000184-72.2021.8.26.0431','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Osvaldo Quartaroli Junior, Reqdo Construtora Marimbondo Ltda','BZ0001P8H0000',NULL,'P001245',NULL,NULL,'03-12-2024',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(39,'0000217-74.2024.8.26.0431','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Exeqte Osvaldo Quartaroli Junior, Exectdo Construtora Marimbondo Ltda','BZ00026QY0000',NULL,'P001245',NULL,NULL,'28-09-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(40,'2366575-43.2024.8.26.0000','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Agravante: Construtora Marimbondo Ltda., Agravado: Osvaldo Quartaroli Junior',NULL,'RI008HE0212KW','P001245',NULL,NULL,'30-05-2025',NULL,2,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(41,'1000883-63.2021.8.26.0431','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Flavio Rodrigo Mariano Pagan, Reqdo Construtora Marimbondo Ltda, Perito LUIZ CARLOS ESPANHOL','BZ0001QBO0000','RI008LKBF0000','P001246',NULL,NULL,'07-04-2025',NULL,2,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(42,'1002524-27.2021.8.26.0483','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Alex Ramos dos Santos, Reqdo Nova Era Loteadora e Urbanismo Ltda','DF0002DH50000',NULL,'P001247',NULL,NULL,'20-01-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(43,'1002220-24.2020.8.26.0431','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Apelante: Construtora Marimbondo Ltda., Apelado: Izael Nunes da Silva',NULL,'RI007CPZP0000','P001248',NULL,NULL,'19-06-2024',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(44,'0001258-76.2024.8.26.0431','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Exeqte Izael Nunes da Silva, Exectdo Construtora Marimbondo Ltda','BZ00029OX0000',NULL,'P001248',NULL,NULL,'11-10-2024',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(45,'1001847-56.2021.8.26.0431','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Raquel Carvalho de Macedo, Reqdo Construtora Marimbondo Ltda, Perito LUIZ CARLOS ESPANHOL','BZ0001RTL0000','RI008Z1320000','P001249',NULL,NULL,'03-11-2025',NULL,2,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(46,'1001835-79.2021.8.26.0063','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Edvaldo Benedito dos Santos, Reqda Marcela Aparecida Luiz',NULL,'RI00817QC12KW','P001251',NULL,NULL,'26-03-2025',NULL,3,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(47,'1000393-07.2022.8.26.0431','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Apte/Apdo: Fabiano Vieira Arruda, Apdo/Apte: Construtora Marimbondo Ltda.','BZ0001TYZ0000','RI00960JO0000','P001253',NULL,NULL,'11-11-2025',NULL,2,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(48,'1000394-89.2022.8.26.0431','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Apte/Apda: Josiane Oliveira Hesiquel, Apdo/Apte: Construtora Marimbondo Ltda.','BZ0001TZ00000','RI008RHV80000','P001254',NULL,NULL,'05-05-2025',NULL,2,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(49,'1000395-74.2022.8.26.0431','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Marcio Alves, Reqdo Construtora Marimbondo Ltda, Perito Luiz Carlos Espanhol',NULL,'RI008LNCM0000','P001255',NULL,NULL,'03-07-2025',NULL,2,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(50,'1000468-46.2022.8.26.0431','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Luís Otávio Fracaroli, Reqdo Construtora Marimbondo Ltda., Perito LUIZ CARLOS ESPANHOL',NULL,'BZ0001U420000','P001256',NULL,NULL,'27-09-2025',NULL,2,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(51,'0000067-59.2025.8.26.0431','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Exeqte Maria Aparecida Leme dos Santos, Exectdo Construtora Marimbondo Ltda.','BZ0002BR30000',NULL,'P001257',NULL,NULL,'22-04-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(52,'1000477-08.2022.8.26.0431','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Maria Aparecida Leme dos Santos, Reqdo Construtora Marimbondo Ltda., Perito LUIZ CARLOS ESPANHOL','BZ0001U4L0000','RI008BNX40000','P001257',NULL,NULL,'19-12-2024',NULL,2,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(53,'1000478-90.2022.8.26.0431','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Fábio Fernando de Oliveira Reis, Reqdo Construtora Marimbondo Ltda., Perito LUIZ CARLOS ESPANHOL','BZ0001U4M0000',NULL,'P001258',NULL,NULL,'23-05-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(54,'1000479-75.2022.8.26.0431','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Edna Aparecida Ezau, Reqdo Construtora Marimbondo Ltda., Perito LUIZ CARLOS ESPANHOL','BZ0001U4N0000','RI008MRHI0000','P001259',NULL,NULL,'31-05-2025',NULL,2,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(55,'1000494-44.2022.8.26.0431','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Estevão Vaz, Reqdo Construtora Marimbondo Ltda., Perito LUIZ CARLOS ESPANHOL','BZ0001U5M0000','RI008ALUS0000','P001260',NULL,NULL,'21-11-2024',NULL,2,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(56,'0000271-06.2025.8.26.0431','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Exeqte Estevão Vaz, Exectdo Construtora Marimbondo Ltda.','BZ0002C8P0000',NULL,'P001260',NULL,NULL,'11-05-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(57,'1000537-78.2022.8.26.0431','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Giseli Cristina Ferreira, Reqdo Construtora Marimbondo Ltda., Perito LUIZ CARLOS ESPANHOL',NULL,'RI0089B3612','P001261',NULL,NULL,'09-06-2025',NULL,2,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(58,'1000630-41.2022.8.26.0431','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Leandro Fernando Rodrigues, Reqdo Construtora Marimbondo Ltda., Perito LUIZ CARLOS ESPANHOL','BZ0001UE30000','RI008Z0PQ0000','P001262',NULL,NULL,'12-08-2025',NULL,8,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(59,'1000643-40.2022.8.26.0431','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Patrícia Luccas, Reqdo Construtora Marimbondo Ltda., Perito LUIZ CARLOS ESPANHOL','BZ0001UEO0000','RI0089SBC0000','P001263',NULL,NULL,'28-05-2025',NULL,2,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(60,'1000823-56.2022.8.26.0431','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Apte/Apdo: Claudio Marcio Fernandes, Apdo/Apte: Construtora Marimbondo Ltda.',NULL,'RI008QX8Y12KW','P001264',NULL,NULL,'24-04-2025',NULL,3,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(61,'0043808-80.2022.8.26.0100','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Exeqte Karina Coe Razuk, Exectdo Omar Antonio Caraballo da Oca','2S001MAYP0000',NULL,'P001266',NULL,NULL,'30-07-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(62,'1045001-16.2022.8.26.0100','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Karina Coe Razuk, Reqdo Omar Antonio Caraballo da Oca','2S001KB9B0000',NULL,'P001266',NULL,NULL,'20-01-2023',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(63,'2096219-41.2023.8.26.0000','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Agravante: KARINA COE RAZUK, Agravado: OMAR ANTONIO CARABALLO MONTES DA OCA',NULL,'RI007FOEJ0000','P001266',NULL,NULL,'08-08-2024',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(64,'0058568-63.2024.8.26.0100','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Exeqte de Leo e Paulino Advogados - Sociedade de Advogados, Exectda Karina Coe Razuk','2S001Y4040000',NULL,'P001266',NULL,NULL,'07-04-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(65,'1000832-18.2022.8.26.0431','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Apte/Apdo: Marcos Roberto Silva, Apdo/Apte: Construtora Marimbondo Ltda.','BZ0001USH0000','RI008NAWU0000','P001268',NULL,NULL,'06-03-2025',NULL,2,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(66,'1000970-82.2022.8.26.0431','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Embargte: Construtora Marimbondo Ltda., Embargdo: Robson Torres Batista',NULL,'RI008WJI512KW','P001269',NULL,NULL,'10-07-2025',NULL,4,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(67,'1002241-87.2022.8.26.0347','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','N/A','9N0002TQZ0000',NULL,'P001270',NULL,NULL,NULL,NULL,0,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(68,'1001050-46.2022.8.26.0431','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Wagner Roberto Gaioto Mariano, Reqdo Construtora Marimbondo Ltda, Perito LUIZ CARLOS ESPANHOL','BZ0001V6Y0000','RI008FKXW0000','P001271',NULL,NULL,'25-04-2025',NULL,2,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(69,'1001078-14.2022.8.26.0431','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Jesus de Oliveira Dias, Reqdo Construtora Marimbondo Ltda, Perito LUIZ CARLOS ESPANHOL','BZ0001V920000',NULL,'P001272',NULL,NULL,'10-12-2024',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(70,'1001160-45.2022.8.26.0431','principal','espera',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Jose Roberto Bilancieri Rodrigues, Reqdo Construtora Marimbondo Ltda, Perito LUIZ CARLOS ESPANHOL','BZ0001VEZ0000',NULL,'P001276',NULL,NULL,'01-12-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(71,'1001244-46.2022.8.26.0431','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Roni Kleber de Freitas, Reqdo Construtora Marimbondo Ltda, Perito LUIZ CARLOS ESPANHOL, Assistente Leandro Campanhã Camara','BZ0001VK40000','RI008MPHW0000','P001277',NULL,NULL,'30-06-2025',NULL,2,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(72,'0001002-02.2025.8.26.0431','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Exeqte Roni Kleber de Freitas, Exectdo Construtora Marimbondo Ltda','BZ0002DW20000',NULL,'P001277',NULL,NULL,'29-10-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(73,'1001135-58.2022.8.26.0584','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','N/A','G8000410G0000',NULL,'P001278',NULL,NULL,NULL,NULL,0,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(74,'1001359-67.2022.8.26.0431','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Celina Fabricio, Reqdo Construtora Marimbondo Ltda, Perito LUIZ CARLOS ESPANHOL',NULL,'RI007W9YY0000','P001279',NULL,NULL,'12-03-2025',NULL,2,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(75,'1000766-38.2022.8.26.0431','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Wilson Antonio Scota, Reqdo Construtora Marimbondo Ltda., Perito LUIZ CARLOS ESPANHOL','BZ0001UNR0000','RI008MPO50000','P001280',NULL,NULL,'03-10-2025',NULL,2,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(76,'1000262-61.2024.8.26.0431','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Luís Carlos Carvalho Firmino, Reqdo Construtora Marimbondo Ltda., Perito LUIZ CARLOS ESPANHOL','BZ00026LQ0000',NULL,'P001297',NULL,NULL,'30-10-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(77,'1001343-16.2022.8.26.0431','principal','espera',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Paulo Eduardo Ribeiro, Reqdo Construtora Marimbondo Ltda, Perito Alfredo Lopes Saab','BZ0001VPW0000',NULL,'P001281',NULL,NULL,'28-11-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(78,'1001676-65.2022.8.26.0431','principal','andamento',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Rodrigo Aparecido Longo, Reqdo Construtora Marimbondo Ltda, Perito Danilo Masson Mattos','BZ0001X2I0000',NULL,'P001283',NULL,NULL,'05-12-2025',NULL,2,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(79,'1001813-47.2022.8.26.0431','principal','espera',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Danilo Fernando Souza, Reqdo Construtora Marimbondo Ltda, Perito LUIZ CARLOS ESPANHOL','BZ0001XAJ0000',NULL,'P001284',NULL,NULL,'12-11-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(80,'1000565-19.2023.8.26.0073','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Embargte: Luciano Jose Menghini, Embargdo: Val Paraiso Empreendimentos Imobiliarios Ltda',NULL,'RI007ZAEX12KW','P001286',NULL,NULL,'15-04-2024',NULL,7,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(81,'0001065-68.2024.8.26.0073','principal','andamento',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Exeqte Val Paraiso Empreendimentos Imobiliarios Ltda., Exectdo Luciano José Menghini','21000529Y0000',NULL,'P001286',NULL,NULL,'04-12-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(82,'1000564-34.2023.8.26.0073','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Val Paraiso Empreendimentos Imobiliários Ltda., Reconvinte Luciano José Menghini, Reqdo Luciano José Menghini, Reconvindo Val Paraiso Empreendimentos Imobiliários Ltda.','210004KRH0000',NULL,'P001287',NULL,NULL,'17-10-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(83,'2223759-04.2025.8.26.0000','apelacao','andamento',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Agravante: Val Paraiso Empreendimentos Imobiliarios Ltda, Agravado: Luciano Jose Menghini',NULL,'RI008X5BI0000','P001287',NULL,NULL,'03-12-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(84,'1000470-98.2022.8.26.0145','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Cia de Saneamento Básico do Estado de São Paulo - SABESP, Reqdo Tapera Grande Empreendimentos Imobiliários Ltda, Perito Walmir Pereira Modotti','410001VO00000',NULL,'P001288',NULL,NULL,'14-08-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(85,'1004151-05.2023.8.26.0319','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Exeqte Boncompagni Empreendimentos Imobiliários Ltda., Exectdo Jacuba Cursos Pré-vestibulares e Business Ltda. e Outros','8V0002O880000',NULL,'P001293',NULL,NULL,'26-06-2024',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(86,'1172104-69.2023.8.26.0100','principal','andamento',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Luciano José Menghini, Reqdo Gerson Edmundo Menghini','2S001SE7S0000',NULL,'P001295',NULL,NULL,'05-12-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(87,'1000004-51.2024.8.26.0431','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Apelante: José Aguinaldo da Silva, Apelado: Construtora Marimbondo Ltda.','BZ000267C0000','RI0093VWI0000','P001296',NULL,NULL,'29-10-2025',NULL,7,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(88,'1000419-34.2024.8.26.0431','principal','andamento',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Carlos Alberto Nunhez, Reqdo Construtora Marimbondo Ltda, Perito LUIZ CARLOS ESPANHOL','BZ00026UR0000',NULL,'P001298',NULL,NULL,'08-12-2025',NULL,5,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(89,'1001538-37.2024.8.26.0073','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Herdeiro Luciano José Menghini,, Reqdo Thea Empreendimentos Imobiliarios S/c Ltda','2100051F90000',NULL,'P001299',NULL,NULL,'05-09-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(90,'2197849-09.2024.8.26.0000','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Agravante: Luciano Jose Menghini, Agravado: Thea Empreendimentos Imobiliários Ltda.',NULL,'RI00870FY0000','P001299',NULL,NULL,'16-01-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(91,'2248817-09.2025.8.26.0000','apelacao','andamento',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Agravante: Val Paraiso Empreendimentos Imobiliarios Ltda, Agravado: Luciano José Menghini,',NULL,'RI008YNGM0000','P001299',NULL,NULL,'03-12-2025',NULL,3,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(92,'1005532-16.2024.8.26.0286','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Borborema Empreendimentos Imobiliários Ltda., Reqda Flávia Alves da Silva Barboza','7Y000BJUG0000',NULL,'P001300',NULL,NULL,'12-09-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(93,'1005020-33.2024.8.26.0286','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Ana Carolina da Silva, Reqdo Borborema Empreendimentos Imobiliários Ltda','7Y000BJ9W0000','RI008QB7F0000','P001301',NULL,NULL,'02-10-2025',NULL,2,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(94,'1004869-67.2024.8.26.0286','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Flávia Alves da Silva Barboza, Reconvinte Borborema Empreendimentos Imobiliários Ltda, Reqdo Borborema Empreendimentos Imobiliários Ltda, Reconvinda Flávia Alves da Silva Barboza','7Y000BJ2U0000',NULL,'P001302',NULL,NULL,'03-10-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(95,'1001816-31.2024.8.26.0431','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Maicon William Marques, Reqdo Construtora Marimbondo Ltda, Perito LUIZ CARLOS ESPANHOL','BZ000292R0000',NULL,'P001303',NULL,NULL,'20-05-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(96,'1002234-66.2024.8.26.0431','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Mario Wilson Teodoro, Reqdo Construtora Marimbondo Ltda., Perito LUIZ CARLOS ESPANHOL','BZ00029OM0000',NULL,'P001304',NULL,NULL,'03-10-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(97,'1011437-02.2024.8.26.0286','principal','andamento',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Município de Itu, Reqdo Boncompagni Empr Imob Ltda, Perito Rafael Oto Bayer','7Y000BW9C0000',NULL,'P001305',NULL,NULL,'08-12-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(98,'1503193-84.2024.8.26.0073','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','N/A','210005A2V0000',NULL,'P001309',NULL,NULL,NULL,NULL,0,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(99,'1198425-10.2024.8.26.0100','principal','andamento',NULL,NULL,'1ª Instância',NULL,NULL,'Fernando Coe Razuk','Exeqte Condominio Residencial Helbor Home Flex Jardins, Exectdo Fernando Coe Razuk, Endereço Eletrônico Desconhecido,','DF0003CDV0000',NULL,'P001310',NULL,NULL,'05-12-2025',NULL,5,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(100,'1010877-57.2025.8.26.0405','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Manoel Severino Felix da Silva, Reqdo Borborema Empreendimentos Imobiliários Ltda','B9000LCV40000',NULL,'P001311',NULL,NULL,'07-10-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(101,'1033309-83.2023.8.26.0003','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Reqte Darlan Carneiro da Silva, Reqdo Washington Martins Ferreira Bento',NULL,'RI0088JRR0000','P002128',NULL,NULL,'17-02-2025',NULL,2,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(102,'0007490-30.2024.8.26.0003','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Exeqte Darlan Carneiro da Silva, Exectdo Washington Martins Ferreira Bento','03001FBN80000',NULL,'P002128',NULL,NULL,'23-07-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(103,'2234434-60.2024.8.26.0000','apelacao','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Agravante: Washington Martins Ferreira Bento, Agravada: Márcia Maria de Oliveira Carneiro',NULL,'RI00898J612L0','P002128ED',NULL,NULL,'29-11-2024',NULL,6,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(104,'0003199-50.2025.8.26.0003','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Exeqte Danilo Calhado Rodrigues, Exectdo Darlan Carneiro da Silva','03001G4XR0000',NULL,'P002128',NULL,NULL,'27-08-2025',NULL,1,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(105,'1003453-96.2023.8.26.0319','principal','novo',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','N/A','8V0002NC20000',NULL,'Cachoeirinha',NULL,NULL,NULL,NULL,0,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
INSERT INTO "processos" VALUES(106,'1002875-58.2025.8.26.0483','principal','andamento',NULL,NULL,'1ª Instância',NULL,NULL,'N/A','Exeqte Kleber Giacomini, Exectdo Elton José de França Chicalé','DF0003CDV0000',NULL,'P001308',NULL,NULL,'05-12-2025',NULL,2,'2025-12-12 13:50:47','2025-12-12 13:50:47','migração_excel');
CREATE INDEX idx_processos_cnj ON processos(cnj);
CREATE INDEX idx_processos_status ON processos(status);
CREATE INDEX idx_andamentos_processo ON andamentos(processo_id);
CREATE INDEX idx_prazos_processo ON prazos(processo_id);
CREATE INDEX idx_auditoria_processo ON auditoria(processo_id);
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('processos',106);
INSERT INTO "sqlite_sequence" VALUES('auditoria',116);
INSERT INTO "sqlite_sequence" VALUES('andamentos',167);
INSERT INTO "sqlite_sequence" VALUES('prazos',101);
COMMIT;
