import '../models/gallery_model.dart';
import '../models/setting_model.dart';

class Utils {
  static List<GalleryModel> galleryList = [
    GalleryModel(title: 'Photos', icon: 'photos', usedSpace: 10),
    GalleryModel(title: 'Videos', icon: 'videos', usedSpace: 14),
    GalleryModel(title: 'Notes', icon: 'notes', usedSpace: 0.5),
    GalleryModel(title: 'Documents', icon: 'documents', usedSpace: 0.06),
  ];

  static List<SettingModel> generalSettingList = [
    SettingModel(
        title: 'Change Pin',
        icon: 'pin',
        gotoPage: '',
        subTitle: 'Change your account pin'),
    SettingModel(
        title: 'Auto lock',
        icon: 'lock',
        gotoPage: '',
        subTitle: 'Set auto lock time for cobra vault'),
    SettingModel(
        title: 'Change Language',
        icon: 'language',
        gotoPage: '',
        subTitle: 'Choose your preferred language for cobra vault'),
    SettingModel(
        title: 'Durss Password',
        icon: 'pin',
        gotoPage: '',
        subTitle: 'Set duress password to woipe to app data'),
    SettingModel(
        title: 'Register Email',
        icon: 'email',
        gotoPage: '',
        subTitle: 'Register your email address to reset password'),
  ];
  static List<SettingModel> privacyList = [
    SettingModel(
        title: 'Privacy Policy',
        icon: 'privacy',
        gotoPage: '',
        subTitle: 'Read our privacy policy'),
    SettingModel(
        title: 'Terms and Services',
        icon: 'terms',
        gotoPage: '',
        subTitle: 'Read our terms and services'),
  ];
  static List<SettingModel> communicationList = [
    SettingModel(title: 'Contact us', icon: 'contact', gotoPage: ''),
    SettingModel(title: 'Email us', icon: 'email', gotoPage: ''),
    SettingModel(title: 'Our Website', icon: 'website', gotoPage: ''),
    SettingModel(title: 'Follow us', icon: 'follow', gotoPage: ''),
  ];
  static List<SettingModel> othersList = [
    SettingModel(title: 'Rate us', icon: 'rate', gotoPage: ''),
    SettingModel(title: 'Share us', icon: 'share', gotoPage: ''),
  ];
}
