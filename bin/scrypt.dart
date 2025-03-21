import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

// Инициализация Firebase
Future<void> initializeFirebase() async {
  await Firebase.initializeApp(); // Автоматическая инициализация
}

// Добавление данных о компаниях
Future<void> addItems() async {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  final items = [
    {
      'id': '1',
      'name': 'Яндекс (Yandex)',
      'description':
      'Крупнейшая российская IT-компания, предоставляющая услуги поиска, карт, такси и облачных сервисов.',
      'images': [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF0GALj-9VGLL4HBjh92Y8W26c3c3kWwCmDw&s',
        'https://www.gazeta.uz/media/img/2024/07/tk20vf17204152077436_l.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3A9sWtwbYIyUnVnI1F1EAZucC5gcWc6DsYA&s',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFrpzzXbRr4B7S8piiRI74MXq3-LvG57PKfw&s',
        'https://music.yandex.com/pages/main/i/og/home_com.png?webp=false',
        'https://i.pinimg.com/564x/6d/7e/ef/6d7eef905c5adf624002d48053237aa7.jpg',
        'https://s0.rbk.ru/v6_top_pics/media/img/4/74/755708064145744.jpeg',
      ],
    },
    {
      'id': '2',
      'name': 'Mail.ru Group',
      'description':
      'Одна из крупнейших IT-компаний России, владеющая почтовыми сервисами, соцсетями и игровыми проектами.',
      'images': [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Mail.Ru_Logo_2018.svg/2560px-Mail.Ru_Logo_2018.svg.png',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCQZhSQs7DYAQF1v4nSwYQBi6xPlhiCv2NFg&s',
        'https://s3-eu-central-1.amazonaws.com/news.pr-cy.ru/49127/images/e11c6e42c7aa83f2d92fd8977324ce6e.jpg',
        'https://paradigm.mail.ru/notionStatic/df48344a-82f9-4507-8ea1-b0f945de4a3b.png',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUxueorHtqJqjdNrAaFbZqNeHFy5NRuNAEkA&s',
        'https://cdn5.vedomosti.ru/image/2019/10/mnj4o/original-tcz.jpg',
        'https://corpmedia.ru/images/cache/320x200/00/21/8546.jpg',
      ],
    },
    {
      'id': '3',
      'name': 'Kaspersky Lab',
      'description':
      'Международная компания, специализирующаяся на разработке антивирусного ПО и кибербезопасности.',
      'images': [
        'https://allsoft.by/upload/programs_pictograms/0d5/0d552f8686fe0afd01e79957d9a5917c.png',
        'https://media.kasperskydaily.com/wp-content/uploads/sites/90/2019/07/22155726/kaspersky-rebranding-in-details-1.jpg',
        'https://media.kasperskydaily.com/wp-content/uploads/sites/90/2019/06/04175201/kaspersky-blog-default-featured.jpg',
        'https://www.mysoft.by/upload/iblock/321/coum84g214y8cq082xr7acvb57wp4npx.jpg',
        'https://t-sputnik.ru/upload/iblock/345/3455ee7030204e7ed48f4dd9c5e26053.png',
        'https://www.karma-group.ru/upload/iblock/c49/kasperski-lab.jpg',
        'https://i.guim.co.uk/img/media/c3c79938b8d55805b57edca50a07718f2e8c1177/0_442_5310_3189/master/5310.jpg?width=465&dpr=1&s=none&crop=none',
      ],
    },
    {
      'id': '4',
      'name': 'ABBYY',
      'description':
      'Компания, занимающаяся разработкой решений для обработки текста и анализа данных.',
      'images': [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpQMT3G_0wdY2FJZsVYgovJJupCfJX_HOtLA&s',
        'https://www.softmagazin.ru/upload/iblock/898/8984e8c284b1c82ace34b2275e439471.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1T5hY3IzkerMzDFOjRBBxMwwvpnGinBC4xw&s',
        'https://cdn.forbes.ru/forbes-static/new/2024/10/TASS-28095240-copy-66fc08a592c5e.jpg',
        'https://static.cnews.ru/img/news/2023/06/22/abbii_700.jpg',
        'https://s0.rbk.ru/v6_top_pics/media/img/9/40/347278068126409.jpeg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6Bf_PE1ECylaA9hiQtfBrgmN2hCkOO3WqKg&s',
      ],
    },
    {
      'id': '5',
      'name': '1С',
      'description':
      'Компания, разрабатывающая программное обеспечение для бухгалтерии и бизнеса.',
      'images': [
        'https://www.bsut.by/images/MainMenuFiles/ObUniversitete/Podrazdeleniya/OIT/LOGO.png',
        'https://wizard-c.ru/wp-content/uploads/2023/05/001.jpg',
        'https://isbel.by/wp-content/uploads/2021/04/1%D1%81.png',
        'https://www.1pro.by/upload/iblock/12e/12ec1b80ab73ccbf7a7cbe685eb8b095.png',
        'https://static.cnews.ru/galleries/2024/11/21/nesterov_600x600.jpeg',
        'https://prosoft.by/wp-content/uploads/2019/06/1spredpriyatie-8.-wms-avtomatizacziya-sklada.jpg',
        'https://profxp.ru/upload/iblock/09e/gwpmlm0bl898zsyqa7k9ks5c7tnpg7uv.png',
      ],
    },
    {
      'id': '6',
      'name': 'Тинькофф (Tinkoff)',
      'description':
      'Финтех-компания, предоставляющая банковские и инвестиционные услуги через цифровые платформы.',
      'images': [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTS29VXHpLYCHXXsDM2PL4QqhoS-kk_AYY4yg&s',
      ],
    },
    {
      'id': '7',
      'name': 'Сбер (Sber)',
      'description':
      'Крупнейший банк России, активно развивающий IT-направление и экосистему цифровых сервисов.',
      'images': [
        'https://static.rustore.ru/imgproxy/9dhjp-pQPvmfYpc90hiqWQE9mUBqhWqtgvHzNkpXFY0/preset:app_card_icon/aHR0cHM6Ly9zdGF0aWMucnVzdG9yZS5ydS9hcGsvNDYyMjcxL2NvbnRlbnQvSUNPTi9mMWIzYzY4YS1iNzM0LTQ4Y2UtYjYyZi00OTAyMDhkM2ZhMGUucG5n.webp',
      ],
    },
    {
      'id': '8',
      'name': 'Ростелеком (Rostelecom)',
      'description':
      'Ведущий телекоммуникационный оператор России, предоставляющий услуги связи и IT-решения.',
      'images': [
        'https://habrastorage.org/getpro/moikrug/uploads/company/717/596/287/logo/medium_565ce8678920c5a28c3cf4977efb6408.png',
      ],
    },
    {
      'id': '9',
      'name': 'CESCA',
      'description':
      'Компания-разработчик и ИТ‑интегратор систем, программно-аппаратных комплексов и уникальных решений, представленный на рынке ИТ‑услуг.',
      'images': [
        'https://habrastorage.org/getpro/moikrug/uploads/company/100/007/917/0/logo/medium_83b5009e040969ee7b60362ad7426573.jpeg',
      ],
    },
    {
      'id': '10',
      'name': 'Positive Technologies',
      'description':
      'Компания, специализирующаяся на защите информационных систем и предотвращении кибератак.',

      'images': [
        'https://habrastorage.org/getpro/moikrug/uploads/company/100/004/467/5/logo/big_a7cbbb58f99396a79fd6c6ea317799f7.jpg',
      ],},
    {
      'id': '11',
      'name': 'Acronis',
      'description':
      'Разработчик решений для резервного копирования и киберзащиты данных.',
      'images': [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLbCYffMgiiMwWAZdenlZU4mf3qpmFMyGaPw&s',
      ], },
    {
      'id': '12',
      'name': 'Parallels',
      'description':
      'Компания, создающая программное обеспечение для виртуализации и управления серверами.',
      'images': [
        'https://store-images.s-microsoft.com/image/apps.53032.41129e2f-98ba-4346-a177-64b6f3bdf829.5a21cba0-c45d-4fc1-b8ad-d7e65d581e2f.f918b05f-fcbc-447b-80a6-60b011162b43',
      ],  },
    {
      'id': '13',
      'name': 'JetBrains',
      'description':
      'Разработчик инструментов для программистов, таких как IntelliJ IDEA и PyCharm.',
      'images': [
        'https://pbs.twimg.com/profile_images/1790416612660592646/icx8Y2tA_400x400.png',
      ],  },
    {
      'id': '14',
      'name': 'VK (ранее ВКонтакте)',
      'description':
      'Социальная сеть и экосистема цифровых сервисов, включая музыку, игры и образование.',
      'images': [
        'https://cdn.forbes.ru/forbes-static/new/2022/02/vk-621a46b20b3e6.jpg',
      ],  },
    {
      'id': '15',
      'name': 'Ozon',
      'description':
      'Российский онлайн-ритейлер, предоставляющий широкий ассортимент товаров.',
      'images': [
        'https://ir-3.ozone.ru/s3/multimedia-1-r/c1000/7179992295.jpg',
      ], },
    {
      'id': '16',
      'name': 'Wildberries',
      'description':
      'Крупнейшая маркетплейс-платформа в России, специализирующаяся на продаже одежды и товаров.',
      'images': [
        'https://habrastorage.org/getpro/moikrug/uploads/company/100/004/679/1/logo/big_52d6473a9db6fc51ff16b12c9c83e8bb.jpg',
      ], },
    {
      'id': '17',
      'name': 'Xsolla',
      'description':
      'Компания, предоставляющая платежные решения для игровой индустрии.',
      'images': [
        'https://upload.wikimedia.org/wikipedia/commons/b/b7/Xsolla-main.jpg',
      ], },
    {
      'id': '18',
      'name': 'QIWI',
      'description':
      'Финтех-компания, предоставляющая платежные и финансовые сервисы.',
      'images': [
        'https://play-lh.googleusercontent.com/ComSFGw8EUKsS8PhN9pTuMHuYaNxgANEWAkCr8BVr9Dsi6vZB-ChgHYmizpJaatRjbM',
      ], },
    {
      'id': '19',
      'name': 'M.Video-Eldorado',
      'description':
      'Крупнейшая розничная сеть электроники и бытовой техники в России.',
      'images': [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9ExsKMkhk5VIRlyJ3hNXAD6ggnCJT1zqDRg&s',
      ], },
    {
      'id': '20',
      'name': 'Softline',
      'description':
      'IT-компания, предоставляющая решения для цифровой трансформации бизнеса.',
      'images': [
        'https://yt3.googleusercontent.com/yLBkCUJGv_DmLm1WdUdWmfIZI0n8bxAjD4iaQvQ6gZ4w1trqKW2Wp43TbjfBZYlH6-ZsfbDeCA=s900-c-k-c0x00ffffff-no-rj',
      ], },
    {
      'id': '21',
      'name': 'EPAM Systems',
      'description':
      'Одна из крупнейших IT-компаний Беларуси, предоставляющая услуги по разработке программного обеспечения и консалтингу.',
      'images': [
        'https://play-lh.googleusercontent.com/L3w73ZSvHAU3C6PmPWeuqKEHe67igSj5Ahovxlf0vBSdWi-31_PrLbHBHoSwmzAVzw',
      ], },
    {
      'id': '22',
      'name': 'Wargaming',
      'description':
      'Компания, специализирующаяся на разработке многопользовательских онлайн-игр, таких как World of Tanks.',
      'images': [
        'https://play-lh.googleusercontent.com/9KpJ5xswo80BWJ-GJyb9zRIHjORMkNCe4Eq1hKkEz8XHEAIQMEHMLzc30Rpe8Er4C7o',
      ], },
    {
      'id': '23',
      'name': 'Viber Media',
      'description':
      'Компания, разработавшая популярное приложение для обмена сообщениями и звонков Viber.',
      'images': [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlnn8Ff0gZFTT2n82mHNZjLW-qHL0qwkeikA&s',
      ], },
    {
      'id': '24',
      'name': 'BelHard',
      'description':
      'Группа компаний, предоставляющая IT-услуги, включая разработку программного обеспечения и аутсорсинг.',
      'images': [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpOiHACnyYlACnnOEdIxYCgSgp0WnVtTGBmw&s',
      ], },
    {
      'id': '25',
      'name': 'Itransition',
      'description':
      'Компания, предоставляющая услуги по разработке программного обеспечения, ИТ-консалтингу и аутсорсингу.',
      'images': [
        'https://media.licdn.com/dms/image/v2/C4D0BAQFvejl3pZ83Tg/company-logo_200_200/company-logo_200_200/0/1630530813963/itransition_logo?e=2147483647&v=beta&t=rMiWai8Pf7agJdpylDYzJ6Pt-YKciwkNlm7FyI1jln4',
      ], },
    {
      'id': '26',
      'name': 'Intetics',
      'description':
      'IT-компания, специализирующаяся на разработке программного обеспечения, тестировании и поддержке.',
      'images': [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqeVCMKC5DmP6TogSP5509u1iVjzmNIDUqZg&s',
      ], },
    {
      'id': '27',
      'name': 'ScienceSoft',
      'description':
      'Компания, предоставляющая услуги по разработке программного обеспечения и ИТ-консалтингу.',
      'images': [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSr1EctSN_ykiJNVSf11EyUmKPVPGvpqemBQQ&s',
      ], },
    {
      'id': '28',
      'name': 'SolbegSoft',
      'description':
      'Компания, занимающаяся разработкой программного обеспечения и предоставлением IT-услуг.',
      'images': [
        'https://media.licdn.com/dms/image/v2/C4D0BAQGh72Rrc18jjw/company-logo_200_200/company-logo_200_200/0/1648197854733/solbeg_logo?e=2147483647&v=beta&t=eYv4TCBd34Z1eDuGhsQ-_PPnv1NYSBuxX8BVfmXnkZo',
      ], },
    {
      'id': '29',
      'name': 'Synesis',
      'description':
      'Компания, специализирующаяся на разработке решений для видеонаблюдения, аналитики и безопасности.',
      'images': [
        'https://habrastorage.org/getpro/moikrug/uploads/company/627/263/468/logo/medium_066872dd8766cfb1bc58acca90e573ed.png',
      ], },
    {
      'id': '30',
      'name': 'Gismart',
      'description':
      'Компания, разрабатывающая мобильные приложения и игры, такие как Cool Goal! и Cleon.',
      'images': [
        'https://play-lh.googleusercontent.com/WbJFocJsMQbr_3wQn-ztLEhmWwSMDNfNcVT58mlus02IpBg7Vo5tlku9IsZYh0TyYFoV',
      ], },
  ];

  for (var item in items) {
    await _db.collection('items').add(item);
  }
  print('Данные о компаниях успешно добавлены.');
}

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized(); // Необходимо для Flutter-зависимостей
    await initializeFirebase();
    await addItems();
    print('Скрипт завершил работу.');
  } catch (e) {
    print('Произошла ошибка: $e');
  } finally {
    exit(0); // Завершаем выполнение скрипта
  }
}