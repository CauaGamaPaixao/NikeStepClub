var database = require("../database/config");

function buscarAquariosPorEmpresa(idUsuario) {

  var instrucaoSql = `SELECT Tenis.modelo FROM Usuario JOIN Inventario ON fkUsuario = idUsuario JOIN Tenis ON fkTenis = idTenis WHERE idUsuario = ${idUsuario}`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function cadastrar(empresaId, descricao) {
  
  var instrucaoSql = `INSERT INTO (descricao, fk_empresa) aquario VALUES (${descricao}, ${empresaId})`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}


module.exports = {
  buscarAquariosPorEmpresa,
  cadastrar
}
