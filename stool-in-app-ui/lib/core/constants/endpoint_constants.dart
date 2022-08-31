class EndpointConstants {
  EndpointConstants._();
  static const signIn = '/user';
  static const login = '/login';
  static const passwordReset = '/user';
  static const postUserData = '/user-data';
  static const getServiceProvider = '/service-provider';
  static const getRules = '/rules';
  static const getFrequentDoubts = '/frequent-doubts';
  static const getCategories = '/categories';
  static const createServiceProvider = '/service-provider';
  static const updateUserData = '/user-data/user-patch';
  static const createServiceType = '/service-types';
  static const updateServiceProvider =
      '/service-provider/update-service-provider';
  static const getUserServiceTypes = '/service-types/get-all-my-services';
  static const deleteUserServiceTypes = '/service-types';
  static const searchServiceProvider =
      '/service-provider/service-provider-search';
  static const getUserDataUnique = '/user-data/user-data-unique';
  static const getServiceProviderDataUnique =
      '/service-provider/service-provider-search/unique';
  static const createServicesToExecute = '/service-to-execute';
  static const updateServicesToExecute = '/service-to-execute';
  static const getMyServicesToExecute = '/service-to-execute/search-my';
  static const getServicesToExecuteUnique = '/service-to-execute';
  static const deleteServicesToExecute = '/service-to-execute';
}
