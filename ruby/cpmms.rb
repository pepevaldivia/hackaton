require "simple-spreadsheet"
require 'mongo'
require 'bson'
require 'json'

def mongo
	Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'db_rep')
end

s = SimpleSpreadsheet::Workbook.read("../ods/cpmms.ods")
s.selected_sheet = s.sheets.first
s.first_row.upto(s.last_row) do |line|
	clase_de_aviso = s.cell(line, 1)
	aviso = s.cell(line, 2)
	orden = s.cell(line, 3)
	equipo = s.cell(line, 4)
	ubicac_tecnica = s.cell(line, 5)
	denominacion_1 = s.cell(line, 6)
	denominacion_2 = s.cell(line, 7)
	descripcion = s.cell(line, 8)
	status_sistema = s.cell(line, 9)
	status_usuario = s.cell(line, 10)
	pto_tbjo_resp = s.cell(line, 11)
	prioridad_1 = s.cell(line, 12)
	prioridad_2 = s.cell(line, 13)
	fache_de_aviso = s.cell(line, 14)
	autor_de_aviso = s.cell(line, 15)
	modificado_el = s.cell(line, 16)
	modificado_por = s.cell(line, 17)
	inicio_desado = s.cell(line, 18)
	fin_deseado = s.cell(line, 19)
	ctrl_tecnico_el = s.cell(line, 20)
	ctrl_tecnico_de = s.cell(line, 21)
	fecha_de_cierre = s.cell(line, 22)
	perfil_catalogo = s.cell(line, 23)
	sociedad_co = s.cell(line, 24)
	denomin_int_resp_ej = s.cell(line, 25)
	codig_txt_cod = s.cell(line, 26)
	centro_planif = s.cell(line, 27)
	dt = s.cell(line, 28)
	area = s.cell(line, 29)
	ssee_lltt = s.cell(line, 30)
	orden_pregunta = s.cell(line, 31)
	equipo_pregunta = s.cell(line, 32)
	anio_fd = s.cell(line, 33)
	mes_fd = s.cell(line, 34)
	requiere_equipo = s.cell(line, 35)
	status_final = s.cell(line, 36)
	status_usuario_final = s.cell(line, 37)
	condicion = s.cell(line, 38)


  	documento = {
		'clase_de_aviso' => clase_de_aviso, 
		'aviso' => aviso, 
		'orden' => orden, 
		'equipo' => equipo, 
		'ubicac_tecnica' => ubicac_tecnica, 
		'denominacion_1' => denominacion_1, 
		'denominacion_2' => denominacion_2, 
		'descripcion' => descripcion, 
		'status_sistema' => status_sistema, 
		'status_usuario' => status_usuario, 
		'pto_tbjo_resp' => pto_tbjo_resp, 
		'prioridad_1' => prioridad_1, 
		'prioridad_2' => prioridad_2, 
		'fache_de_aviso' => fache_de_aviso, 
		'autor_de_aviso' => autor_de_aviso, 
		'modificado_el' => modificado_el, 
		'modificado_por' => modificado_por, 
		'inicio_desado' => inicio_desado, 
		'fin_deseado' => fin_deseado, 
		'ctrl_tecnico_el' => ctrl_tecnico_el, 
		'ctrl_tecnico_de' => ctrl_tecnico_de, 
		'fecha_de_cierre' => fecha_de_cierre, 
		'perfil_catalogo' => perfil_catalogo, 
		'sociedad_co' => sociedad_co, 
		'denomin_int_resp_ej' => denomin_int_resp_ej, 
		'codig_txt_cod' => codig_txt_cod, 
		'centro_planif' => centro_planif, 
		'dt' => dt, 
		'area' => area, 
		'ssee_lltt' => ssee_lltt, 
		'orden_pregunta' => orden_pregunta, 
		'equipo_pregunta' => equipo_pregunta, 
		'anio_fd' => anio_fd, 
		'mes_fd' => mes_fd, 
		'requiere_equipo' => requiere_equipo, 
		'status_final' => status_final, 
		'status_usuario_final' => status_usuario_final, 
		'condicion' => condicion
	}

  	mongo_client =  mongo
	mongo_client[:cpmms].insert_one(documento)
	mongo_client.close

end