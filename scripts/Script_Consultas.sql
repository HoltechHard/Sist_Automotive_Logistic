/*==============================================================*/
/* 10 CONSULTAS SQL IMPORTANTES PARA O SISTEMA LOGISTICO
/*==============================================================*/

/* 			---	CONSULTA 01	---
   Apartir de ACESSO_OPERACAO(ID_USuario,Operaçao_Codigo,Data_Operacao,Hora_Operacao),    	
   mostrar o nome das operacoes que foram acedidas por Alexander no dia anterior 
   fazendo a contagem do numero de vezes que foram acedidas 
*/

select op.nome,count(ao.operacao_codigo) as num_acessos 
from acesso_operacao ao
inner join operacao op
on op.codigo=ao.operacao_codigo
where ao.id_usuario in (
   select id_usuario 
   from usuario
   where login='Alexander')  and
ao.Data_Operacao=(select current_date-1 as hoje)
group by op.nome;

/*			---	CONSULTA 02	--- 
   Apartir de ACESSO(Permissao_ID,Menu_Codigo,Estado), mostrar a descricao dos permissos 
   de usuario de nivel de acesso 3 que tem mais de 5 operacoes de estado 'C' (critico) que 
   podem ser acessadas mostrando tambem a contagem das operacoes a que tem acesso 	 
*/

select p.descricao,count(ac.operacao_codigo) as num_op
from acesso ac 
inner join permissao p
on p.id_permissao=ac.permissao_id
where ac.permissao_id in ( 
   select id_permissao 
   from permissao
   where nivel_acesso=3) and
ac.estado='C'
group by p.descricao
having count(ac.operacao_codigo)>5;

/*			---	CONSULTA 03	--- 
   Apartir de AGENTE_VENDAS(CPF,Tipo_doc,nro_doc,%comissao,ranking,volume_vendas),
   mostrar o nome das 10 concessionarias que maior volumen de vendas acumulado
   obteve pela sua equipe de agentes de vendas
*/

select e.nome_comercial,sum(av.volume_vendas) as vendas
from agente_vendas av
inner join concessionaria c
on c.tipo_doc=av.tipo_doc and c.nro_doc=av.nro_doc
inner join empresa e
on e.tipo_doc=c.tipo_doc and e.nro_doc=c.nro_doc
group by e.nome_comercial
order by sum(av.volume_vendas)
limit 10

/*			---	CONSULTA 04	--- 	 
   A partir de FORNECIMENTO(Codigo_Pedido,Nro_Fornecimento,Nro_Modelo,Tipo_doc,Nro_doc,
   data_entrega,frete,desconto,preco_unit,quantidade,status_envio), mostrar a lista dos
   fornecedores e seu volume de negocio neto, somente se o fornecedor brinda pelo menos
   10 variedades diferentes de peças      
*/

select e.nome_comercial,sum((100-ff.desconto)*100*(ff.preco_unit*ff.quantidade)-ff.frete) as total
from fornecimento ff
inner join fornecedor f
on f.tipo_doc=ff.tipo_doc and f.nro_doc=ff.nro_doc
inner join empresa e
on e.tipo_doc=f.tipo_doc and e.nro_doc=f.nro_doc 
group by e.nome_comercial
having count(ff.nro_modelo)>=10

/*			---	CONSULTA 05	---
   A partir de DETALHE_VENDA(nro_documento,id_automovel,preco_base,unidades,subtotal), 
   mostrar o automovel comercial que mais foi vendido no ano 2016 
*/

select aux.id_automovel,max(aux.nro_autos) as num_vend
from (select dv.id_automovel,sum(dv.unidades) as nro_autos
   from detalhe_venda dv
   inner join documento_venda dd
   on dv.nro_documento=dd.nro_documento
   where date_part('year',dd.data)=2016  
   group by dv.id_automovel) as aux
group by aux.id_automovel 

/*			---	CONSULTA 06	--- 
   A partir de DET_MONTAGEM(Nro_Montagem,Nro_Modelo,Quantidade), mostrar a lista com o  
   nome das pecas e o total de pecas empregadas para todas as montagens feitas para o
   modelo de automovel comercial que mais foi vendido no ano 2016 
*/

select p.nome,sum(dm.quantidade) as total_pecas 
from det_montagem dm
inner join peca p
on p.nro_modelo=dm.nro_modelo
where dm.nro_montagem in (
   select a.nro_montagem
   from automovel a
   inner join comercial c
   on c.id_automovel=a.id_automovel
   where a.id_automovel in (select aut.id_automovel from (
	select aux.id_automovel,max(aux.nro_autos) as num_vend
	from (select dv.id_automovel,sum(dv.unidades) as nro_autos
		from detalhe_venda dv
		inner join documento_venda dd
		on dv.nro_documento=dd.nro_documento
		where date_part('year',dd.data)=2016  
		group by dv.id_automovel) as aux
	     group by aux.id_automovel) as aut))
group by p.nome

/*		---	CONSULTA 07	---		
   A partir de DOCUMENTO_LEILAO(Id_automovel,CPF,nro_documento,oferta_inicial,
   oferta_final,data_fech,status_remate), obter um relatorio de todos os meses
   do ano 2016 e o acumulado das ofertas finais para leiloeiros de nivel de 
   afiliacao 3 que tenham vendido automoveis de luxo com motores de 8 cilindros 
   e como mínimo tenam vendido 5 modelos de auto de luxo diferentes
*/
 
select distinct(date_part('month',data_fech)) as mes, sum(oferta_final) as total
from documento_leilao
where id_automovel in (
   select id_automovel
   from de_luxo
   where cilindrada=8) and
cpf in (
   select cpf
   from leiloeiro
   where nivel_afiliacao=3)
group by date_part('month',data_fech)
having count(id_automovel)>=5

/*		---	CONSULTA 08	--- 
   A partir de CARREGAMENTO(Nro_Carregamento,Nro_viagem,tipo_doc,nro_doc,descricao,
   quantidade,peso_bruto,preco_nacional,taxa_cambio,preco_dolares,data_chegada,estado),
   gerar um relatorio do ponto de embarque que transportou o maior valor de preço em
   dólares no ano 2016, tomando em consideracao que para poder ser exportado o peso 
   em bruto nao pode superar as 20000 toneladas nem uma quantidade maior a 100 autos,
   a distribuicao dos valores em dolares mensalmente durante o ano 2016   
*/

select date_part('month',c.data_chegada) as mes,sum(c.preco_dolares) as total
from viagem_exportacao v
inner join carregamento c
on c.nro_viagem=v.nro_viagem
where v.ponto_embarque in (
  select tbl.ponto_embarque
  from (
     select ve.ponto_embarque,max(aux.total) as valort
     from (
       select c.nro_viagem,sum(c.preco_dolares) as total
       from carregamento c  
       where c.peso_bruto<=20000 and 
       c.quantidade<=100 and date_part('year',c.data_chegada)=2016
       group by c.nro_viagem) as aux
       inner join viagem_exportacao ve
       on ve.nro_viagem=aux.nro_viagem 
     group by ve.ponto_embarque) as tbl)
group by date_part('month',c.data_chegada)

/*		---	CONSULTA 09/10	--- 
   A partir de DETALE_VENDA(Nro_documento,id_automovel,preco_base,unidades,subtotal) 
   efetivar uma venda que tem o numero de documento definido  1000 e que pretende comprar 
   2 unid automovel comercial 100 a um preco base de $ 60 000, 3 do automovel 101
   a um preco base de $ 45 000 e 1 do automovel 102 a $ 30 000. 
   - Atualizar o subtotal do detale de venda 
   - Atualizar o total calculado no documento de venda  
*/

insert into detalhe_venda(nro_documento,id_automovel,preco_base,unidades)
values(1000,100,60000,2)

insert into detalhe_venda(nro_documento,id_automovel,preco_base,unidades)
values(1000,101,45000,3)

insert into detalhe_venda(nro_documento,id_automovel,preco_base,unidades)
values(1000,102,30000,1)

update detalhe_venda dt
  set dt.subtotal=(select aux.preco_base*aux.unidades 
	from detalhe_venda aux 
	where dt.nro_documento=aux.nro_documento)
where dt.nro_documento=1000 

update documento_venda dv
  set dv.total_pagar=(select dt.nro_documento,sum(dt.subtotal) 
		from detalhe_venda dt
		group by dt.nro_documento)
where dv.nro_documento=1000
