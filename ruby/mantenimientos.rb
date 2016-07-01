require "simple-spreadsheet"
require 'mongo'
require 'bson'
require 'json'

def mongo
	Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'db_rep')
end

s = SimpleSpreadsheet::Workbook.read("../ods/mantenimiento.ods")
s.selected_sheet = s.sheets.first
s.first_row.upto(s.last_row) do |line|
  	area_de_empresa = s.cell(line, 1)
  	orden = s.cell(line, 2)
  	clase_orden = s.cell(line, 3)
  	ubicac_tecnica = s.cell(line, 4)
  	texto_breve = s.cell(line, 5)
  	fe_inic_extrema = s.cell(line, 6)
  	fe_fin_extrema = s.cell(line, 7)
  	total_gen_real = s.cell(line, 8)
	tot_gen_plan  = s.cell(line, 9)  	
   status_sistema = s.cell(line, 10)
   ci_actividad_pm = s.cell(line, 11)
  	ceco_responsable = s.cell(line, 12)
  	cebe = s.cell(line, 13)
  	tpo_tbjo_resp = s.cell(line, 14)
  	revision = s.cell(line, 15)
  	aviso = s.cell(line, 16)
  	equipo = s.cell(line, 17)
  	fecha_entrada = s.cell(line, 18)

  	documento = {
		'area_de_empresa' => area_de_empresa, 
		'orden' => orden, 
		'clase_orden' => clase_orden, 
		'ubicac_tecnica' => ubicac_tecnica, 
		'texto_breve' => texto_breve, 
		'fe_inic_extrema' => fe_inic_extrema, 
		'fe_fin_extrema' => fe_fin_extrema, 
		'total_gen_real' => total_gen_real, 
		'tot_gen_plan'  => tot_gen_plan,    	
		'status_sistema' => status_sistema, 
		'ci_actividad_pm' => ci_actividad_pm, 
		'ceco_responsable' => ceco_responsable, 
		'cebe' => cebe, 
		'tpo_tbjo_resp' => tpo_tbjo_resp, 
		'revision' => revision, 
		'aviso' => aviso, 
		'equipo' => equipo, 
		'fecha_entrada' => fecha_entrada
	}

  	mongo_client =  mongo
	mongo_client[:mantenimientos].insert_one(documento)
	mongo_client.close

end