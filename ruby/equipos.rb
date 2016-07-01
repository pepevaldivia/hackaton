require "simple-spreadsheet"
require 'mongo'
require 'bson'
require 'json'

def mongo
	Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'db_rep')
end

s = SimpleSpreadsheet::Workbook.read("../ods/equipos.ods")
s.selected_sheet = s.sheets.first
s.first_row.upto(s.last_row) do |line|
  	equpo = s.cell(line, 1)
  	ce_emplazam = s.cell(line, 2)
  	pto_tbjo_resp = s.cell(line, 3)
  	grupo_planif  = s.cell(line, 4)
  	ubicac_tecnica = s.cell(line, 5)
  	status_sistema = s.cell(line, 6)
  	denominacion = s.cell(line, 7)
  	tp_objeto = s.cell(line, 8)
	campo_clasif = s.cell(line, 9)  	
   tipo_equipo = s.cell(line, 10)
   denominacion_2 = s.cell(line, 11)
  	modificado_el = s.cell(line, 12)
  	modificado_por = s.cell(line, 13)
  	area_de_empresa = s.cell(line, 14)
  	centro_planif = s.cell(line, 15)
  	perfil_catalogo = s.cell(line, 16)

  	documento = {
		'equpo' => equpo, 
		'ce_emplazam' => ce_emplazam, 
		'pto_tbjo_resp' => pto_tbjo_resp, 
		'grupo_planif' => grupo_planif, 
		'ubicac_tecnica' => ubicac_tecnica, 
		'status_sistema' => status_sistema, 
		'denominacion' => denominacion, 
		'tp_objeto' => tp_objeto, 
		'campo_clasif' => campo_clasif, 
		'tipo_equipo' => tipo_equipo, 
		'denominacion_2' => denominacion_2, 
		'modificado_el' => modificado_el, 
		'modificado_por' => modificado_por, 
		'area_de_empresa' => area_de_empresa, 
		'centro_planif' => centro_planif, 
		'perfil_catalogo' => perfil_catalogo
	}

  	mongo_client =  mongo
	mongo_client[:equipos].insert_one(documento)
	mongo_client.close

end