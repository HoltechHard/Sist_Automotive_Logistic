/*==============================================================*/
/* Table: ACESSO                                                */
/*==============================================================*/
create table ACESSO (
   PERMISSAO_ID         INT4                 not null,
   OPERACAO_CODIGO      INT4                 not null,
   ESTADO               CHAR(1)              null,
   constraint PK_ACESSO primary key (PERMISSAO_ID, OPERACAO_CODIGO)
);

/*==============================================================*/
/* Table: ACESSO_OPERACAO                                       */
/*==============================================================*/
create table ACESSO_OPERACAO (
   ID_USUARIO           INT4                 not null,
   OPERACAO_CODIGO      INT4                 not null,
   DATA_OPERACAO        DATE                 not null,
   HORA_OPERACAO        TIME                 not null,
   constraint PK_ACESSO_OPERACAO primary key (ID_USUARIO, OPERACAO_CODIGO, DATA_OPERACAO, HORA_OPERACAO)
);

/*==============================================================*/
/* Table: AGENTE_VENDAS                                         */
/*==============================================================*/
create table AGENTE_VENDAS (
   CPF                  INT4                 not null,
   TIPO_DOC             INT4                 null,
   NRO_DOC              INT4                 null,
   _COMISSAO            DECIMAL(6,3)         null,
   RANKING              INT4                 null,
   VOLUME_VENDAS        DECIMAL(8,2)         null,
   constraint PK_AGENTE_VENDAS primary key (CPF)
);

/*==============================================================*/
/* Table: AREA_MONTAGEM                                         */
/*==============================================================*/
create table AREA_MONTAGEM (
   NRO_MONTADORA        INT4                 not null,
   TIPO_DOC             INT4                 null,
   NRO_DOC              INT4                 null,
   NOME                 VARCHAR(50)          null,
   LOCALIZACAO          VARCHAR(255)         null,
   CAPACIDADE           INT4                 null,
   constraint PK_AREA_MONTAGEM primary key (NRO_MONTADORA)
);

/*==============================================================*/
/* Table: ARMAZEM                                               */
/*==============================================================*/
create table ARMAZEM (
   TIPO_DOC             INT4                 not null,
   NRO_DOC              INT4                 not null,
   CAP_MAX              INT4                 null,
   CAP_DISPONIVEL       INT4                 null,
   ENCARREGADO          VARCHAR(50)          null,
   constraint PK_ARMAZEM primary key (TIPO_DOC, NRO_DOC)
);

/*==============================================================*/
/* Table: AUTOMOBILISTICA                                       */
/*==============================================================*/
create table AUTOMOBILISTICA (
   TIPO_DOC             INT4                 not null,
   NRO_DOC              INT4                 not null,
   TOTAL_MONTADORAS     INT4                 null,
   VOLUME_AUT           INT4                 null,
   constraint PK_AUTOMOBILISTICA primary key (TIPO_DOC, NRO_DOC)
);

/*==============================================================*/
/* Table: AUTOMOVEL                                             */
/*==============================================================*/
create table AUTOMOVEL (
   ID_AUTOMOVEL         INT4                 not null,
   NRO_MONTAGEM         INT4                 null,
   MODELO               VARCHAR(50)          null,
   MARCA                VARCHAR(50)          null,
   PLACA                VARCHAR(15)          null,
   ANO                  INT4                 null,
   COR                  VARCHAR(20)          null,
   PESO                 DECIMAL(8,2)         null,
   PRECO_FABRICA        DECIMAL(8,2)         null,
   constraint PK_AUTOMOVEL primary key (ID_AUTOMOVEL)
);

/*==============================================================*/
/* Table: CARREGAMENTO                                          */
/*==============================================================*/
create table CARREGAMENTO (
   NRO_CARREGAMENTO     INT4                 not null,
   NRO_VIAGEM           INT4                 null,
   TIPO_DOC             INT4                 null,
   NRO_DOC              INT4                 null,
   DESCRICAO            VARCHAR(50)          null,
   QUANTIDADE           INT4                 null,
   PESO_BRUTO           DECIMAL(9,3)         null,
   PRECO_NACIONAL       DECIMAL(8,2)         null,
   TAXA_CAMBIO          DECIMAL(5,3)         null,
   PRECO_DOLARES        DECIMAL(8,2)         null,
   DATA_CHEGADA         DATE                 null,
   ESTADO               CHAR(1)              null,
   constraint PK_CARREGAMENTO primary key (NRO_CARREGAMENTO)
);

/*==============================================================*/
/* Table: CIDADE                                                */
/*==============================================================*/
create table CIDADE (
   ID_CIDADE            INT4                 not null,
   ID_PAIS              INT4                 null,
   CIDADE               VARCHAR(50)          null,
   constraint PK_CIDADE primary key (ID_CIDADE)
);

/*==============================================================*/
/* Table: COMERCIAL                                             */
/*==============================================================*/
create table COMERCIAL (
   ID_AUTOMOVEL         INT4                 not null,
   GARANTIA             VARCHAR(30)          null,
   NRO_OCUPANTES        INT4                 null,
   constraint PK_COMERCIAL primary key (ID_AUTOMOVEL)
);

/*==============================================================*/
/* Table: CONCESSIONARIA                                        */
/*==============================================================*/
create table CONCESSIONARIA (
   TIPO_DOC             INT4                 not null,
   NRO_DOC              INT4                 not null,
   NIVEL_PARCERIA       INT4                 null,
   constraint PK_CONCESSIONARIA primary key (TIPO_DOC, NRO_DOC)
);

/*==============================================================*/
/* Table: CONTATO                                               */
/*==============================================================*/
create table CONTATO (
   ID_CONTATO           INT4                 not null,
   TIPO_DOC             INT4                 not null,
   NRO_DOC              INT4                 not null,
   CONTATO              VARCHAR(255)         null,
   constraint PK_CONTATO primary key (ID_CONTATO, TIPO_DOC, NRO_DOC)
);

/*==============================================================*/
/* Table: DETALHE_VENDA                                         */
/*==============================================================*/
create table DETALHE_VENDA (
   NRO_DOCUMENTO        INT4                 not null,
   ID_AUTOMOVEL         INT4                 not null,
   PRECO_BASE           DECIMAL(8,2)         null,
   UNIDADES             INT4                 null,
   SUBTOTAL             DECIMAL(8,2)         null,
   constraint PK_DETALHE_VENDA primary key (NRO_DOCUMENTO, ID_AUTOMOVEL)
);

/*==============================================================*/
/* Table: DET_MONTAGEM                                          */
/*==============================================================*/
create table DET_MONTAGEM (
   NRO_MONTAGEM         INT4                 not null,
   NRO_MODELO           INT4                 not null,
   QUANTIDADE           INT4                 null,
   constraint PK_DET_MONTAGEM primary key (NRO_MONTAGEM, NRO_MODELO)
);

/*==============================================================*/
/* Table: DE_LUXO                                               */
/*==============================================================*/
create table DE_LUXO (
   ID_AUTOMOVEL         INT4                 not null,
   SUSPENSAO            DECIMAL(6,3)         null,
   TRACAO               DECIMAL(6,3)         null,
   POTENCIA             DECIMAL(7,3)         null,
   CILINDRADA           INT4                 null,
   TEMPO_ACEL           DECIMAL(5,3)         null,
   VEL_MAX              DECIMAL(6,3)         null,
   AERODINAMICA         VARCHAR(30)          null,
   constraint PK_DE_LUXO primary key (ID_AUTOMOVEL)
);

/*==============================================================*/
/* Table: DOCUMENTO_LEILAO                                      */
/*==============================================================*/
create table DOCUMENTO_LEILAO (
   ID_AUTOMOVEL         INT4                 not null,
   CPF                  INT4                 not null,
   NRO_DOCUMENTO        INT4                 null,
   OFERTA_INICIAL       DECIMAL(8,2)         null,
   OFERTA_FINAL         DECIMAL(8,2)         null,
   DATA_FECH            DATE                 null,
   STATUS_REMATE        VARCHAR(1)           null,
   constraint PK_DOCUMENTO_LEILAO primary key (ID_AUTOMOVEL, CPF)
);

/*==============================================================*/
/* Table: DOCUMENTO_VENDA                                       */
/*==============================================================*/
create table DOCUMENTO_VENDA (
   NRO_DOCUMENTO        INT4                 not null,
   CPF                  INT4                 null,
   DATA                 DATE                 null,
   MARGEM_BENEF         DECIMAL(5,3)         null,
   TOTAL_PAGAR          DECIMAL(8,2)         null,
   constraint PK_DOCUMENTO_VENDA primary key (NRO_DOCUMENTO)
);

/*==============================================================*/
/* Table: EMPRESA                                               */
/*==============================================================*/
create table EMPRESA (
   TIPO_DOC             INT4                 not null,
   NRO_DOC              INT4                 not null,
   NOME_COMERCIAL       VARCHAR(50)          null,
   SETOR                VARCHAR(30)          null,
   WEB                  VARCHAR(255)         null,
   constraint PK_EMPRESA primary key (TIPO_DOC, NRO_DOC)
);

/*==============================================================*/
/* Table: EXPORTACAO_DIRETA                                     */
/*==============================================================*/
create table EXPORTACAO_DIRETA (
   NRO_RE               INT4                 not null,
   NRO_VIAGEM           INT4                 not null,
   TEMPO_ENVIO          VARCHAR(20)          null,
   CONVENIO_ICMS        VARCHAR(20)          null,
   constraint PK_EXPORTACAO_DIRETA primary key (NRO_RE, NRO_VIAGEM)
);

/*==============================================================*/
/* Table: EXPORTACAO_INDIRETA                                   */
/*==============================================================*/
create table EXPORTACAO_INDIRETA (
   NRO_RE               INT4                 not null,
   NRO_VIAGEM           INT4                 not null,
   NOME_EXPORTADOR      VARCHAR(255)         null,
   NOME_IMPORTADOR      VARCHAR(255)         null,
   IMPOSTO_ALF          DECIMAL(8,2)         null,
   constraint PK_EXPORTACAO_INDIRETA primary key (NRO_RE, NRO_VIAGEM)
);

/*==============================================================*/
/* Table: FEIRA_EXPOSICAO                                       */
/*==============================================================*/
create table FEIRA_EXPOSICAO (
   TIPO_DOC             INT4                 not null,
   NRO_DOC              INT4                 not null,
   DATA_A_              DATE                 null,
   DATA_FECHAMENTO      DATE                 null,
   NUM_ASSISTENTES      INT4                 null,
   constraint PK_FEIRA_EXPOSICAO primary key (TIPO_DOC, NRO_DOC)
);

/*==============================================================*/
/* Table: FORNECEDOR                                            */
/*==============================================================*/
create table FORNECEDOR (
   TIPO_DOC             INT4                 not null,
   NRO_DOC              INT4                 not null,
   POSICAO_GEO          VARCHAR(50)          null,
   PARCERIA             CHAR(1)              null,
   constraint PK_FORNECEDOR primary key (TIPO_DOC, NRO_DOC)
);

/*==============================================================*/
/* Table: FORNECIMENTO                                          */
/*==============================================================*/
create table FORNECIMENTO (
   CODIGO_PEDIDO        INT4                 not null,
   NRO_FORNECIMENTO     INT4                 not null,
   NRO_MODELO           INT4                 null,
   TIPO_DOC             INT4                 null,
   NRO_DOC              INT4                 null,
   DATA_ENTREGA         DATE                 null,
   FRETE                DECIMAL(8,2)         null,
   DESCONTO             DECIMAL(5,3)         null,
   PRECO_UNIT           DECIMAL(8,2)         null,
   QUANTIDADE           INT4                 null,
   STATUS_ENVIO         CHAR(1)              null,
   constraint PK_FORNECIMENTO primary key (CODIGO_PEDIDO, NRO_FORNECIMENTO)
);

/*==============================================================*/
/* Table: LEILOEIRO                                             */
/*==============================================================*/
create table LEILOEIRO (
   CPF                  INT4                 not null,
   TIPO_DOC             INT4                 not null,
   NRO_DOC              INT4                 not null,
   NIVEL_AFILIACAO      INT4                 null,
   _COMISSAO            DECIMAL(5,3)         null,
   SERVICO              VARCHAR(40)          null,
   constraint PK_LEILOEIRO primary key (CPF)
);

/*==============================================================*/
/* Table: LOCALIZACAO                                           */
/*==============================================================*/
create table LOCALIZACAO (
   ID_LOCALIZACAO       INT4                 not null,
   ID_CIDADE            INT4                 null,
   TIPO_DOC             INT4                 null,
   NRO_DOC              INT4                 null,
   LOCALIZACAO          VARCHAR(50)          null,
   constraint PK_LOCALIZACAO primary key (ID_LOCALIZACAO)
);

/*==============================================================*/
/* Table: LOTE                                                  */
/*==============================================================*/
create table LOTE (
   NRO_LOTE             INT4                 not null,
   NRO_CARREGAMENTO     INT4                 null,
   MARCA                VARCHAR(30)          null,
   QUANTIDADE           INT4                 null,
   DATA_LOT             DATE                 null,
   STATUS               CHAR(1)              null,
   constraint PK_LOTE primary key (NRO_LOTE)
);

/*==============================================================*/
/* Table: MENU                                                  */
/*==============================================================*/
create table MENU (
   CODIGO               INT4                 not null,
   TITULO               VARCHAR(30)          not null,
   DESCRICAO            VARCHAR(255)         null,
   URL                  VARCHAR(255)         null,
   ESTADO               BOOL                 null,
   constraint PK_MENU primary key (CODIGO)
);

/*==============================================================*/
/* Table: MONTAGEM                                              */
/*==============================================================*/
create table MONTAGEM (
   NRO_MONTAGEM         INT4                 not null,
   NRO_MONTADORA        INT4                 null,
   DATA_MONTAGEM        DATE                 null,
   ESTADO               CHAR(1)              null,
   constraint PK_MONTAGEM primary key (NRO_MONTAGEM)
);

/*==============================================================*/
/* Table: NAVIO                                                 */
/*==============================================================*/
create table NAVIO (
   ISPS                 INT4                 not null,
   SINAL_CHAMADA        VARCHAR(30)          null,
   BANDEIRA             CHAR(254)            null,
   CAPACIDADE           INT4                 null,
   DIMENSAO             VARCHAR(20)          null,
   constraint PK_NAVIO primary key (ISPS)
);

/*==============================================================*/
/* Table: OPERACAO                                              */
/*==============================================================*/
create table OPERACAO (
   CODIGO               INT4                 not null,
   NOME                 VARCHAR(30)          null,
   URL                  VARCHAR(255)         null,
   DESCRICAO            VARCHAR(255)         null,
   MENU_CODIGO          INT4                 null,
   constraint PK_OPERACAO primary key (CODIGO)
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS (
   ID_PAIS              INT4                 not null,
   PAIS                 VARCHAR(50)          null,
   constraint PK_PAIS primary key (ID_PAIS)
);

/*==============================================================*/
/* Table: PECA                                                  */
/*==============================================================*/
create table PECA (
   NRO_MODELO           INT4                 not null,
   NOME                 VARCHAR(50)          null,
   DIMENSOES            VARCHAR(30)          null,
   DESEMPENHO           DECIMAL(5,3)         null,
   GARANTIA             VARCHAR(30)          null,
   constraint PK_PECA primary key (NRO_MODELO)
);

/*==============================================================*/
/* Table: PEDIDO                                                */
/*==============================================================*/
create table PEDIDO (
   CODIGO               INT4                 not null,
   ID_USUARIO           INT4                 null,
   DESCRICAO            VARCHAR(50)          null,
   DATA_PEDIDO          DATE                 null,
   DATA_CONFIRMACAO     DATE                 null,
   NOTIFICACAO          VARCHAR(255)         null,
   constraint PK_PEDIDO primary key (CODIGO)
);

/*==============================================================*/
/* Table: PERMISSAO                                             */
/*==============================================================*/
create table PERMISSAO (
   ID_PERMISSAO         INT4                 not null,
   ID_USUARIO           INT4                 null,
   DESCRICAO            VARCHAR(30)          null,
   NIVEL_ACESSO         INT4                 null,
   PRIORIDADE           INT4                 null,
   constraint PK_PERMISSAO primary key (ID_PERMISSAO)
);

/*==============================================================*/
/* Table: TESTE_QUALIDADE                                       */
/*==============================================================*/
create table TESTE_QUALIDADE (
   CODIGO               INT4                 not null,
   DESCRICAO            VARCHAR(50)          null,
   UNID_MEDIDA          VARCHAR(30)          null,
   PARAMETRO            VARCHAR(30)          null,
   VALOR_MIN            DECIMAL(6,3)         null,
   VALOR_PADRAO         DECIMAL(6,3)         null,
   VALOR_MAX            DECIMAL(6,3)         null,
   constraint PK_TESTE_QUALIDADE primary key (CODIGO)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   ID_USUARIO           INT4                 not null,
   USU_ID_USUARIO       INT4                 null,
   LOGIN                VARCHAR(30)          not null,
   SENHA                VARCHAR(255)         not null,
   NOME                 VARCHAR(50)          null,
   CARGO                VARCHAR(30)          null,
   ESTADO               BOOL                 null,
   constraint PK_USUARIO primary key (ID_USUARIO)
);

/*==============================================================*/
/* Table: VERIFICACAO                                           */
/*==============================================================*/
create table VERIFICACAO (
   NRO_MONTAGEM         INT4                 null,
   CODIGO               INT4                 null,
   VALOR                DECIMAL(6,3)         null,
   ESTADO               BOOL                 null
);

/*==============================================================*/
/* Table: VIAGEM_DISTRIBUICAO                                   */
/*==============================================================*/
create table VIAGEM_DISTRIBUICAO (
   NRO_LOTE             INT4                 not null,
   TIPO_DOC             INT4                 not null,
   NRO_DOC              INT4                 not null,
   DATA_VIAGEM          DATE                 null,
   HORARIO_PARTIDA      TIME                 null,
   ESTADO               CHAR(1)              null,
   constraint PK_VIAGEM_DISTRIBUICAO primary key (NRO_LOTE, TIPO_DOC, NRO_DOC)
);

/*==============================================================*/
/* Table: VIAGEM_EXPORTACAO                                     */
/*==============================================================*/
create table VIAGEM_EXPORTACAO (
   NRO_VIAGEM           INT4                 not null,
   ISPS                 INT4                 null,
   PONTO_EMBARQUE       VARCHAR(255)         null,
   DATA_VIAGEM          DATE                 null,
   AGENTE_PORTADOR      VARCHAR(50)          null,
   OPERADOR             VARCHAR(50)          null,
   REMITENTE            VARCHAR(50)          null,
   DESTINATARIO         VARCHAR(50)          null,
   DATA_REGISTRO        DATE                 null,
   constraint PK_VIAGEM_EXPORTACAO primary key (NRO_VIAGEM)
);

alter table ACESSO
   add constraint FK_ACESSO_REFERENCE_PERMISSA foreign key (PERMISSAO_ID)
      references PERMISSAO (ID_PERMISSAO)
      on delete restrict on update restrict;

alter table ACESSO
   add constraint FK_ACESSO_REFERENCE_OPERACAO foreign key (OPERACAO_CODIGO)
      references OPERACAO (CODIGO)
      on delete restrict on update restrict;

alter table ACESSO_OPERACAO
   add constraint FK_ACESSO_O_REFERENCE_OPERACAO foreign key (OPERACAO_CODIGO)
      references OPERACAO (CODIGO)
      on delete restrict on update restrict;

alter table ACESSO_OPERACAO
   add constraint FK_ACESSO_O_REFERENCE_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO)
      on delete restrict on update restrict;

alter table AGENTE_VENDAS
   add constraint FK_AGENTE_V_REFERENCE_CONCESSI foreign key (TIPO_DOC, NRO_DOC)
      references CONCESSIONARIA (TIPO_DOC, NRO_DOC)
      on delete restrict on update restrict;

alter table AREA_MONTAGEM
   add constraint FK_AREA_MON_REFERENCE_AUTOMOBI foreign key (TIPO_DOC, NRO_DOC)
      references AUTOMOBILISTICA (TIPO_DOC, NRO_DOC)
      on delete restrict on update restrict;

alter table ARMAZEM
   add constraint FK_ARMAZEM_REFERENCE_EMPRESA foreign key (TIPO_DOC, NRO_DOC)
      references EMPRESA (TIPO_DOC, NRO_DOC)
      on delete restrict on update restrict;

alter table AUTOMOBILISTICA
   add constraint FK_AUTOMOBI_REFERENCE_EMPRESA foreign key (TIPO_DOC, NRO_DOC)
      references EMPRESA (TIPO_DOC, NRO_DOC)
      on delete restrict on update restrict;

alter table AUTOMOVEL
   add constraint FK_AUTOMOVE_REFERENCE_MONTAGEM foreign key (NRO_MONTAGEM)
      references MONTAGEM (NRO_MONTAGEM)
      on delete restrict on update restrict;

alter table CARREGAMENTO
   add constraint FK_CARREGAM_REFERENCE_VIAGEM_E foreign key (NRO_VIAGEM)
      references VIAGEM_EXPORTACAO (NRO_VIAGEM)
      on delete restrict on update restrict;

alter table CARREGAMENTO
   add constraint FK_CARREGAM_REFERENCE_ARMAZEM foreign key (TIPO_DOC, NRO_DOC)
      references ARMAZEM (TIPO_DOC, NRO_DOC)
      on delete restrict on update restrict;

alter table CIDADE
   add constraint FK_CIDADE_REFERENCE_PAIS foreign key (ID_PAIS)
      references PAIS (ID_PAIS)
      on delete restrict on update restrict;

alter table COMERCIAL
   add constraint FK_COMERCIA_REFERENCE_AUTOMOVE foreign key (ID_AUTOMOVEL)
      references AUTOMOVEL (ID_AUTOMOVEL)
      on delete restrict on update restrict;

alter table CONCESSIONARIA
   add constraint FK_CONCESSI_REFERENCE_EMPRESA foreign key (TIPO_DOC, NRO_DOC)
      references EMPRESA (TIPO_DOC, NRO_DOC)
      on delete restrict on update restrict;

alter table CONTATO
   add constraint FK_CONTATO_REFERENCE_CONCESSI foreign key (TIPO_DOC, NRO_DOC)
      references CONCESSIONARIA (TIPO_DOC, NRO_DOC)
      on delete restrict on update restrict;

alter table DETALHE_VENDA
   add constraint FK_DETALHE__REFERENCE_DOCUMENT foreign key (NRO_DOCUMENTO)
      references DOCUMENTO_VENDA (NRO_DOCUMENTO)
      on delete restrict on update restrict;

alter table DETALHE_VENDA
   add constraint FK_DETALHE__REFERENCE_COMERCIA foreign key (ID_AUTOMOVEL)
      references COMERCIAL (ID_AUTOMOVEL)
      on delete restrict on update restrict;

alter table DET_MONTAGEM
   add constraint FK_DET_MONT_REFERENCE_MONTAGEM foreign key (NRO_MONTAGEM)
      references MONTAGEM (NRO_MONTAGEM)
      on delete restrict on update restrict;

alter table DET_MONTAGEM
   add constraint FK_DET_MONT_REFERENCE_PECA foreign key (NRO_MODELO)
      references PECA (NRO_MODELO)
      on delete restrict on update restrict;

alter table DE_LUXO
   add constraint FK_DE_LUXO_REFERENCE_AUTOMOVE foreign key (ID_AUTOMOVEL)
      references AUTOMOVEL (ID_AUTOMOVEL)
      on delete restrict on update restrict;

alter table DOCUMENTO_LEILAO
   add constraint FK_DOCUMENT_REFERENCE_DE_LUXO foreign key (ID_AUTOMOVEL)
      references DE_LUXO (ID_AUTOMOVEL)
      on delete restrict on update restrict;

alter table DOCUMENTO_LEILAO
   add constraint FK_DOCUMENT_REFERENCE_LEILOEIR foreign key (CPF)
      references LEILOEIRO (CPF)
      on delete restrict on update restrict;

alter table DOCUMENTO_VENDA
   add constraint FK_DOCUMENT_REFERENCE_AGENTE_V foreign key (CPF)
      references AGENTE_VENDAS (CPF)
      on delete restrict on update restrict;

alter table EXPORTACAO_DIRETA
   add constraint FK_EXPORTAC_REFERENCE_VIAGEM_E foreign key (NRO_VIAGEM)
      references VIAGEM_EXPORTACAO (NRO_VIAGEM)
      on delete restrict on update restrict;

alter table EXPORTACAO_INDIRETA
   add constraint FK_EXPORTAC_REFERENCE_VIAGEM_E foreign key (NRO_VIAGEM)
      references VIAGEM_EXPORTACAO (NRO_VIAGEM)
      on delete restrict on update restrict;

alter table FEIRA_EXPOSICAO
   add constraint FK_FEIRA_EX_REFERENCE_EMPRESA foreign key (TIPO_DOC, NRO_DOC)
      references EMPRESA (TIPO_DOC, NRO_DOC)
      on delete restrict on update restrict;

alter table FORNECEDOR
   add constraint FK_FORNECED_REFERENCE_EMPRESA foreign key (TIPO_DOC, NRO_DOC)
      references EMPRESA (TIPO_DOC, NRO_DOC)
      on delete restrict on update restrict;

alter table FORNECIMENTO
   add constraint FK_FORNECIM_REFERENCE_PEDIDO foreign key (CODIGO_PEDIDO)
      references PEDIDO (CODIGO)
      on delete restrict on update restrict;

alter table FORNECIMENTO
   add constraint FK_FORNECIM_REFERENCE_PECA foreign key (NRO_MODELO)
      references PECA (NRO_MODELO)
      on delete restrict on update restrict;

alter table FORNECIMENTO
   add constraint FK_FORNECIM_REFERENCE_FORNECED foreign key (TIPO_DOC, NRO_DOC)
      references FORNECEDOR (TIPO_DOC, NRO_DOC)
      on delete restrict on update restrict;

alter table LEILOEIRO
   add constraint FK_LEILOEIR_REFERENCE_FEIRA_EX foreign key (TIPO_DOC, NRO_DOC)
      references FEIRA_EXPOSICAO (TIPO_DOC, NRO_DOC)
      on delete restrict on update restrict;

alter table LOCALIZACAO
   add constraint FK_LOCALIZA_REFERENCE_CIDADE foreign key (ID_CIDADE)
      references CIDADE (ID_CIDADE)
      on delete restrict on update restrict;

alter table LOCALIZACAO
   add constraint FK_LOCALIZA_REFERENCE_EMPRESA foreign key (TIPO_DOC, NRO_DOC)
      references EMPRESA (TIPO_DOC, NRO_DOC)
      on delete restrict on update restrict;

alter table LOTE
   add constraint FK_LOTE_REFERENCE_CARREGAM foreign key (NRO_CARREGAMENTO)
      references CARREGAMENTO (NRO_CARREGAMENTO)
      on delete restrict on update restrict;

alter table MONTAGEM
   add constraint FK_MONTAGEM_REFERENCE_AREA_MON foreign key (NRO_MONTADORA)
      references AREA_MONTAGEM (NRO_MONTADORA)
      on delete restrict on update restrict;

alter table OPERACAO
   add constraint FK_OPERACAO_REFERENCE_MENU foreign key (MENU_CODIGO)
      references MENU (CODIGO)
      on delete restrict on update restrict;

alter table PEDIDO
   add constraint FK_PEDIDO_REFERENCE_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO)
      on delete restrict on update restrict;

alter table PERMISSAO
   add constraint FK_PERMISSA_REFERENCE_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO)
      on delete restrict on update restrict;

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_USUARIO foreign key (USU_ID_USUARIO)
      references USUARIO (ID_USUARIO)
      on delete restrict on update restrict;

alter table VERIFICACAO
   add constraint FK_VERIFICA_REFERENCE_MONTAGEM foreign key (NRO_MONTAGEM)
      references MONTAGEM (NRO_MONTAGEM)
      on delete restrict on update restrict;

alter table VERIFICACAO
   add constraint FK_VERIFICA_REFERENCE_TESTE_QU foreign key (CODIGO)
      references TESTE_QUALIDADE (CODIGO)
      on delete restrict on update restrict;

alter table VIAGEM_DISTRIBUICAO
   add constraint FK_VIAGEM_D_REFERENCE_LOTE foreign key (NRO_LOTE)
      references LOTE (NRO_LOTE)
      on delete restrict on update restrict;

alter table VIAGEM_DISTRIBUICAO
   add constraint FK_VIAGEM_D_REFERENCE_CONCESSI foreign key (TIPO_DOC, NRO_DOC)
      references CONCESSIONARIA (TIPO_DOC, NRO_DOC)
      on delete restrict on update restrict;

alter table VIAGEM_EXPORTACAO
   add constraint FK_VIAGEM_E_REFERENCE_NAVIO foreign key (ISPS)
      references NAVIO (ISPS)
      on delete restrict on update restrict;
