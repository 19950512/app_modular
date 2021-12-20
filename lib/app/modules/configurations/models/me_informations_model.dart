class MeInformationsModel {
  Empresa empresa;

  MeInformationsModel({required this.empresa});

  static fromJson(Map<String, dynamic> json) {
    var empresa =
        json['empresa'] != null ? Empresa.fromJson(json['empresa']) : null;
    return empresa;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['empresa'] = empresa.toJson();
    return data;
  }
}

class Empresa {
  int empCodigo;
  String empNome;
  bool empAtivo;

  Empresa(
      {required this.empCodigo, required this.empNome, required this.empAtivo});

  static fromJson(Map<String, dynamic> json) {
    var empCodigo = json['emp_codigo'] ?? '';
    var empNome = json['emp_nome'] ?? '';
    var empAtivo = json['emp_ativo'] ?? '';

    return {empCodigo: empCodigo, empNome: empNome, empAtivo: empAtivo};
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['emp_codigo'] = empCodigo;
    data['emp_nome'] = empNome;
    data['emp_ativo'] = empAtivo;
    return data;
  }
}
