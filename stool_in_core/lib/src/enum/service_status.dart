enum ServiceStatus {
  active('ATIVO'),
  inactive('INATIVO'),
  completedAndInactive('COMPLETED-AND-INACTIVE');

  const ServiceStatus(this.status);
  final String status;
}
