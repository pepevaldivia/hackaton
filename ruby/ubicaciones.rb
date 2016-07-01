require "simple-spreadsheet"
require 'mongo'
require 'bson'
require 'json'

def mongo
	Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'db_rep')
end

s = SimpleSpreadsheet::Workbook.read("../ods/ubicaciones.ods")
s.selected_sheet = s.sheets.first
s.first_row.upto(s.last_row) do |line|
  	ubiac_tecnica = s.cell(line, 1)
  	origen_ind_abc = s.cell(line, 2)
  	denominacion = s.cell(line, 3)
  	local = s.cell(line, 4)
  	ind_estructura = s.cell(line, 5)
  	ubic_tec_sup = s.cell(line, 6)
  	centro_planif = s.cell(line, 7)
  	pto_tbjo_resp = s.cell(line, 8)
	area_de_empresa = s.cell(line, 9)  	
   ce_emplazam = s.cell(line, 10)
   status_sistema = s.cell(line, 11)
  	centro_coste = s.cell(line, 12)
  	campo_clasif = s.cell(line, 13)
  	tpo_ubic_tecn = s.cell(line, 14)
  	tp_objecto = s.cell(line, 15)
  	idioma = s.cell(line, 16)
  	pais = s.cell(line, 17)
  	creado_el = s.cell(line, 18)
  	creado_por = s.cell(line, 19)
  	division = s.cell(line, 20)
  	emplazamiento = s.cell(line, 21)
  	emplaz_imputac = s.cell(line, 22)
  	grupo_autoriz = s.cell(line, 23)
  	gr_vendedores = s.cell(line, 24)
  	grupo_planif = s.cell(line, 25)
  	iniciador_abc = s.cell(line, 26)
  	modificado_el = s.cell(line, 27)
  	modificado_por = s.cell(line, 28)
  	montaje_equipos = s.cell(line, 29)
  	n_direccion = s.cell(line, 30)
  	n_objecto = s.cell(line, 31)
  	sist_ident = s.cell(line, 32)
  	sociedad = s.cell(line, 33)
  	sociedad_co = s.cell(line, 34)

  	documento = {
  		'ubiac_tecnica' => ubiac_tecnica,  
		'origen_ind_abc' => origen_ind_abc,  
		'denominacion' => denominacion,  
		'local' => local,  
		'ind_estructura' => ind_estructura,  
		'ubic_tec_sup' => ubic_tec_sup,  
		'centro_planif' => centro_planif,  
		'pto_tbjo_resp' => pto_tbjo_resp,  
		'area_de_empresa' => area_de_empresa,    	
		'ce_emplazam' => ce_emplazam,  
		'status_sistema' => status_sistema,  
		'centro_coste' => centro_coste,  
		'campo_clasif' => campo_clasif,  
		'tpo_ubic_tecn' => tpo_ubic_tecn,  
		'tp_objecto' => tp_objecto,  
		'idioma' => idioma,  
		'pais' => pais,  
		'creado_el' => creado_el,  
		'creado_por' => creado_por,  
		'division' => division,  
		'emplazamiento' => emplazamiento,  
		'emplaz_imputac' => emplaz_imputac,  
		'grupo_autoriz' => grupo_autoriz,  
		'gr_vendedores' => gr_vendedores,  
		'grupo_planif' => grupo_planif,  
		'iniciador_abc' => iniciador_abc,  
		'modificado_el' => modificado_el,  
		'modificado_por' => modificado_por,  
		'montaje_equipos' => montaje_equipos,  
		'n_direccion' => n_direccion,  
		'n_objecto' => n_objecto,  
		'sist_ident' => sist_ident,  
		'sociedad' => sociedad,  
		'sociedad_co' => sociedad_co 
  	}

  	mongo_client =  mongo
	mongo_client[:ubicaciones].insert_one(documento)
	mongo_client.close

end