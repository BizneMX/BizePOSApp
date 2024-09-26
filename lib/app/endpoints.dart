class Endpoints {
  //auth
  static const banners = 'seller/getBanners';
  static const checkPhone = 'seller/checkPhone';
  static const recoverPassword = 'seller/recoverPassword';
  static const login = 'seller/authenticate';
  static const validateToken = 'seller/validateToken';

  //home
  static const setPassword = 'seller/setPassword';
  static const home = 'seller/home';
  static const changeStatus = 'seller/changeStatus';
  static const getTrainings = 'seller/getTrainings';
  static const summaryData = 'seller/resumeData';
  static const currentWeek = 'seller/currentWeek';
  static const getWeek = 'seller/getWeek';
  static const sendEmail = 'seller/sendEmail';
  static const getMenus = 'seller/getMenuCategories';
  static const setMenu = 'seller/setCategoryPic';
  static const deleteMenu = 'seller/deleteCategoryPic';
  static const notifications = 'seller/getNotifications';
  static const scanQr = 'seller/scanQr';
  static const makeACharge = 'seller/charge';
  static const orders = 'seller/getOrders';
  static const acceptOrder = 'seller/acceptOrder';
  static const historial = 'seller/historial';
  static const refreshToken = 'seller/refreshToken';

  //profile
  static const logout = 'seller/logout';
  static const getSchedule = 'seller/getSchedule';
  static const setSchedule = 'seller/setSchedule';
  static const getQR = 'seller/getQr';
  static const profile = 'seller/profile';
  static const changePassword = 'seller/changePassword';
  static const getStaff = 'seller/personal';
  static const blockUnBlock = 'seller/changeStatusPersonal';
  static const addStaff = 'seller/addPersonal';
  static const reserves = 'seller/getBookings';
  static const acceptReserve = 'seller/booking/accept';
  static const rejectReserve = 'seller/booking/reject';
}
