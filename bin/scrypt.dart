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
      'name': 'Яндекс (Yandex)',
      'description':
      'Крупнейшая российская IT-компания, предоставляющая услуги поиска, карт, такси и облачных сервисов.',
      'images': [
        'https://sun9-27.userapi.com/impg/BpSTpBag0UwpxiMTNVWBkkRLXG4UM0IWyfFc4w/BVS6rnyXEe0.jpg?size=320x213&quality=96&crop=53,0,572,381&sign=418309d44ad605a8f809d926ad893ec0&type=album',
        'https://yandex.by/images/search?text=%D1%8F%D0%BD%D0%B4%D0%B5%D0%BA%D1%81+%D1%84%D0%BE%D1%82%D0%BE+%D0%BE%D1%84%D0%B8%D1%81%D0%B0&img_url=https%3A%2F%2Fimages.adsttc.com%2Fmedia%2Fimages%2F530a%2Fb7c3%2Fc07a%2F80c4%2F5f00%2F017f%2Flarge_jpg%2F_DSC_0060.jpg%3F1393211321&pos=6&rpt=simage&serp_list_type=all&stype=image&lr=157&parent-reqid=1740158889098551-5788739008072140912-balancer-l7leveler-kubr-yp-vla-248-BAL&source=serp',
        'https://yandex.by/images/search?text=%D1%8F%D0%BD%D0%B4%D0%B5%D0%BA%D1%81+%D1%84%D0%BE%D1%82%D0%BE+%D0%BE%D1%84%D0%B8%D1%81%D0%B0&img_url=http%3A%2F%2Fatrium.ru%2Fstorage%2Fapp%2Fmedia%2Fuploads%2F5fe%2F354%2F6b7%2F7.jpg&pos=0&rpt=simage&serp_list_type=all&stype=image&lr=157&parent-reqid=1740158889098551-5788739008072140912-balancer-l7leveler-kubr-yp-vla-248-BAL&source=serp',
        'https://yandex.by/images/search?pos=19&from=tabbar&img_url=https%3A%2F%2Fcdn.javarush.com%2Fimages%2Farticle%2F905118f7-60eb-4ef9-8fe5-8df4fffc5d03%2F1024.jpeg&text=%D1%8F%D0%BD%D0%B4%D0%B5%D0%BA%D1%81+%D1%84%D0%BE%D1%82%D0%BE+%D0%BE%D1%84%D0%B8%D1%81%D0%B0&rpt=simage&lr=157',
        'https://yandex.by/images/search?pos=20&from=tabbar&img_url=https%3A%2F%2Favatars.mds.yandex.net%2Fget-altay%2F374295%2F2a0000015b17e007f38ab44da15c4ac508f2%2Forig&text=%D1%8F%D0%BD%D0%B4%D0%B5%D0%BA%D1%81+%D1%84%D0%BE%D1%82%D0%BE+%D0%BE%D1%84%D0%B8%D1%81%D0%B0&rpt=simage&lr=157',
        'https://yandex.by/images/search?pos=21&from=tabbar&img_url=https%3A%2F%2Fsvetoalliance.ru%2Fimages%2FPortfolio%2FOficce_Moscow_5%2Fand.jpg&text=%D1%8F%D0%BD%D0%B4%D0%B5%D0%BA%D1%81+%D1%84%D0%BE%D1%82%D0%BE+%D0%BE%D1%84%D0%B8%D1%81%D0%B0&rpt=simage&lr=157',
        'https://yandex.by/images/search?pos=25&from=tabbar&img_url=https%3A%2F%2Fsun9-22.userapi.com%2FqwPosyRL0v_Aw9SMx33G1FS6vWTXJJ4R6PLUBQ%2FrUiWX0sQfvs.jpg&text=%D1%8F%D0%BD%D0%B4%D0%B5%D0%BA%D1%81+%D1%84%D0%BE%D1%82%D0%BE+%D0%BE%D1%84%D0%B8%D1%81%D0%B0&rpt=simage&lr=157',
      ],
    },
    {
      'name': 'Mail.ru Group',
      'description':
      'Одна из крупнейших IT-компаний России, владеющая почтовыми сервисами, соцсетями и игровыми проектами.',
      'images': [
        '',
        'https://yandex.by/images/search?text=mail+ru+%D1%84%D0%BE%D1%82%D0%BE+%D0%BE%D1%84%D0%B8%D1%81%D0%B0&pos=12&rpt=simage&img_url=https%3A%2F%2Fmedia.rbcdn.ru%2Fmedia%2Fnews%2Fmailru-groupoffice-13.jpg&from=tabbar&lr=157',
        'https://yandex.by/images/search?text=mail+ru+%D1%84%D0%BE%D1%82%D0%BE+%D0%BE%D1%84%D0%B8%D1%81%D0%B0&pos=20&rpt=simage&img_url=http%3A%2F%2Fi.pinimg.com%2Foriginals%2F7e%2F85%2F4c%2F7e854c3337c2dff15e8f85ff47abc55f.jpg&from=tabbar&lr=157',
        'https://yandex.by/images/search?text=mail+ru+%D1%84%D0%BE%D1%82%D0%BE+%D0%BE%D1%84%D0%B8%D1%81%D0%B0&pos=27&rpt=simage&img_url=https%3A%2F%2Fwww.signbusiness.ru%2Fupload%2Fresize_cache%2Fiblock%2Fff1%2F800_800_1%2FIMG_20190821_215103.jpg&from=tabbar&lr=157',
        'https://yandex.by/images/search?p=1&text=mail+ru+%D1%84%D0%BE%D1%82%D0%BE+%D0%BE%D1%84%D0%B8%D1%81%D0%B0&pos=5&rpt=simage&img_url=https%3A%2F%2Fsun9-20.userapi.com%2FGK1ozIrKnOuForHwGZjhCqgc5gZCEZCnf-VI4w%2F2vhbfBIt6N4.jpg&from=tabbar&lr=157',
        'https://yandex.by/images/search?p=2&text=mail+ru+%D1%84%D0%BE%D1%82%D0%BE+%D0%BE%D1%84%D0%B8%D1%81%D0%B0&pos=5&rpt=simage&img_url=https%3A%2F%2F1prime.ru%2Fimages%2F83240%2F81%2F832408180.jpg&from=tabbar&lr=157',
        'https://yandex.by/images/search?p=2&text=mail+ru+%D1%84%D0%BE%D1%82%D0%BE+%D0%BE%D1%84%D0%B8%D1%81%D0%B0&pos=14&rpt=simage&img_url=https%3A%2F%2Fincrussia.ru%2Fwp-content%2Fuploads%2F2020%2F01%2FTASS_32000013-1.jpg&from=tabbar&lr=157',
      ],
    },
    {
      'name': 'Kaspersky Lab',
      'description':
      'Международная компания, специализирующаяся на разработке антивирусного ПО и кибербезопасности.',
      'images': [
        'https://yandex.by/images/search?text=%D0%BA%D0%B0%D1%81%D0%BF%D0%B5%D1%80%D1%81%D0%BA%D0%B8%D0%B9+%D1%84%D0%BE%D1%82%D0%BE+%D0%BE%D1%84%D0%B8%D1%81%D0%B0&pos=0&rpt=simage&img_url=https%3A%2F%2Fmedia.axe.rs%2F2019%2F05%2FKaspersky-1.jpg&from=tabbar&lr=157',
      ],
    },
    {
      'name': 'ABBYY',
      'description':
      'Компания, занимающаяся разработкой решений для обработки текста и анализа данных.',
      'images': [
        'https://yandex.by/images/search?text=abbyy+%D1%84%D0%BE%D1%82%D0%BE+%D0%BE%D1%84%D0%B8%D1%81%D0%B0&pos=0&rpt=simage&img_url=https%3A%2F%2Fcs14.pikabu.ru%2Fpost_img%2F2022%2F02%2F01%2F8%2Fog_og_1643717073281794406.jpg&from=tabbar&lr=157',
      ],
    },
    {
      'name': '1С',
      'description':
      'Компания, разрабатывающая программное обеспечение для бухгалтерии и бизнеса.',
      'images': [
        'https://yandex.by/images/search?text=1c+%D1%84%D0%BE%D1%82%D0%BE+%D0%BE%D1%84%D0%B8%D1%81%D0%B0&pos=0&rpt=simage&img_url=https%3A%2F%2Fscontent-hel3-1.cdninstagram.com%2Fv%2Ft51.2885-15%2Ffr%2Fe15%2Fs1080x1080%2F186415906_1433358090343375_3822145498598082091_n.jpg%3Ftp%3D1%26_nc_ht%3Dscontent-hel3-1.cdninstagram.com%26_nc_cat%3D107%26_nc_ohc%3DBEXJKfumQ_QAX8ilJI5%26edm%3DABfd0MgBAAAA%26ccb%3D7-4%26oh%3D0af63d9f34ee4405a99bd94f9275e9dc%26oe%3D60C9D818%26_nc_sid%3D7bff83&from=tabbar&lr=157',
      ],
    },
    {
      'name': 'Тинькофф (Tinkoff)',
      'description':
      'Финтех-компания, предоставляющая банковские и инвестиционные услуги через цифровые платформы.',
      'images': [
        'https://yandex.by/images/search?text=tinkoff+%D1%84%D0%BE%D1%82%D0%BE+%D0%BE%D1%84%D0%B8%D1%81%D0%B0&pos=6&rpt=simage&img_url=https%3A%2F%2Fstatic.tildacdn.com%2Ftild6566-6337-4365-b037-633333316531%2F13.jpg&from=tabbar&lr=157',
      ],
    },
    {
      'name': 'Сбер (Sber)',
      'description':
      'Крупнейший банк России, активно развивающий IT-направление и экосистему цифровых сервисов.',
      'images': [
        'https://yandex.by/images/search?text=sber+%D1%84%D0%BE%D1%82%D0%BE+%D0%BE%D1%84%D0%B8%D1%81%D0%B0&pos=0&rpt=simage&img_url=https%3A%2F%2Fsia.ru%2Ffiles%2FImage%2Fnews%2F2020-09%2F401980%2Fbig_news_401980_id71769.jpg&from=tabbar&lr=157',
      ],
    },
    {
      'name': 'Ростелеком (Rostelecom)',
      'description':
      'Ведущий телекоммуникационный оператор России, предоставляющий услуги связи и IT-решения.',
      'images': [
        'https://yandex.by/images/search?text=rostelekom+%D1%84%D0%BE%D1%82%D0%BE+%D0%BE%D1%84%D0%B8%D1%81%D0%B0&pos=0&rpt=simage&img_url=https%3A%2F%2Fidei.club%2Fraznoe%2Fuploads%2Fposts%2F2022-12%2F1671828315_idei-club-p-interer-rumyantsevo-dizain-vkontakte-12.jpg&from=tabbar&lr=157',
      ],
    },
    {
      'name': 'CESCA',
      'description':
      'Компания-разработчик и ИТ‑интегратор систем, программно-аппаратных комплексов и уникальных решений, представленный на рынке ИТ‑услуг.',
      'images': [
        'https://yandex.by/images/search?text=cesca+it+%D0%BE%D1%84%D0%B8%D1%81&pos=0&rpt=simage&img_url=https%3A%2F%2Favatars.mds.yandex.net%2Fget-altay%2F3926074%2F2a000001768bcd285b221baac00987301c6b%2Forig&from=tabbar&lr=157',
      ],
    },
    {
      'name': 'Positive Technologies',
      'description':
      'Компания, специализирующаяся на защите информационных систем и предотвращении кибератак.',

      'images': [
        'https://yandex.by/images/search?text=positive+technologies+%D0%BE%D1%84%D0%B8%D1%81&pos=22&rpt=simage&img_url=https%3A%2F%2Fsun9-67.userapi.com%2Fimpg%2FyZ7Fpqo1MLIsTUrz_sCcYSAgdnDHdUtb08e5wQ%2FSBFkv2UnRqE.jpg%3Fsize%3D860x392%26quality%3D95%26sign%3D408617855e7c7751b50d08a2e75dcc49%26c_uniq_tag%3DhdAT6Yr7RmQ4FlvuKWk7LNzdNzefBJ4c0LLnlUMPeUM%26type%3Dalbum&from=tabbar&lr=157',
      ],},
    {
      'name': 'Acronis',
      'description':
      'Разработчик решений для резервного копирования и киберзащиты данных.',
      'images': [
        'https://yandex.by/images/search?text=acronis+technologies+%D0%BE%D1%84%D0%B8%D1%81&pos=1&rpt=simage&img_url=https%3A%2F%2Fmiro.medium.com%2Fv2%2Fresize%3Afit%3A4080%2F1*lXnji8QUN-pGMXHZiDD8rQ.png&from=tabbar&lr=157',
      ], },
    {
      'name': 'Parallels',
      'description':
      'Компания, создающая программное обеспечение для виртуализации и управления серверами.',
      'images': [
        'https://yandex.by/images/search?text=parallelstechnologies+%D0%BE%D1%84%D0%B8%D1%81&pos=2&rpt=simage&img_url=https%3A%2F%2Frb.ru%2Fmedia%2Fupload_tmp%2F6_aSQ2lyM.jpg&from=tabbar&lr=157',
      ],  },
    {
      'name': 'JetBrains',
      'description':
      'Разработчик инструментов для программистов, таких как IntelliJ IDEA и PyCharm.',
      'images': [
        'https://yandex.by/images/search?p=1&text=jetbrains+%D0%BE%D1%84%D0%B8%D1%81&pos=13&rpt=simage&img_url=https%3A%2F%2Fblog.jetbrains.com%2Fwp-content%2Fuploads%2F2021%2F03%2Fksonline_2.jpeg&from=tabbar&lr=157',
      ],  },
    {
      'name': 'VK (ранее ВКонтакте)',
      'description':
      'Социальная сеть и экосистема цифровых сервисов, включая музыку, игры и образование.',
      'images': [
        'https://yandex.by/images/search?text=vk+%D0%BE%D1%84%D0%B8%D1%81&pos=0&rpt=simage&img_url=https%3A%2F%2Fi0.wp.com%2Fstorage.myseldon.com%2Fnews-pict-27%2F27BCC028759BD790FC8C444617DF18C6%3Fssl%3D1&from=tabbar&lr=157',
      ],  },
    {
      'name': 'Ozon',
      'description':
      'Российский онлайн-ритейлер, предоставляющий широкий ассортимент товаров.',
      'images': [
        'https://yandex.by/images/search?text=ozon+%D0%BE%D1%84%D0%B8%D1%81&pos=0&rpt=simage&img_url=https%3A%2F%2Fstatic.tildacdn.com%2Ftild6235-3466-4663-a264-616239326232%2F70.jpg&from=tabbar&lr=157',
      ], },
    {
      'name': 'Wildberries',
      'description':
      'Крупнейшая маркетплейс-платформа в России, специализирующаяся на продаже одежды и товаров.',
      'images': [
        'https://yandex.by/images/search?text=wildberries+%D0%BE%D1%84%D0%B8%D1%81&pos=0&rpt=simage&img_url=http%3A%2F%2F20.img.avito.st%2Fimage%2F1%2F1.7B1GhLa4QPRwLYLxEqfEeVsmQvL4JcL8MCBC9vYtSP7w.bKLtRt3_ra3yjjSBKiK3F5130dRMG6BCAHaH02a7IVA&from=tabbar&lr=157',
      ], },
    {
      'name': 'Xsolla',
      'description':
      'Компания, предоставляющая платежные решения для игровой индустрии.',
      'images': [
        'https://yandex.by/images/search?text=xsolla+%D0%BE%D1%84%D0%B8%D1%81&pos=0&rpt=simage&img_url=https%3A%2F%2Fhabrastorage.org%2Fgetpro%2Fmoikrug%2Fuploads%2Fcompany_photo%2F000%2F011%2F180%2Fphoto%2Fb72609597265b555a68d5ab1e542bab9.jpg&from=tabbar&lr=157',
      ], },
    {
      'name': 'QIWI',
      'description':
      'Финтех-компания, предоставляющая платежные и финансовые сервисы.',
      'images': [
        'https://yandex.by/images/search?text=qiwi+%D0%BE%D1%84%D0%B8%D1%81&pos=1&rpt=simage&img_url=https%3A%2F%2Fnewizv.ru%2Fattachments%2F9a43948cb2e8e3e5805393afa2bd2528db640474%2Fstore%2Fcrop%2F0%2F0%2F1550%2F1152%2F1920%2F0%2F0%2F531d192eaf8204b06bb38fbc079562aad49bed7cfa60018905f9b3fe5050%2F04584b8ab7c8d4dfa383e28d55a91162533bdf8adb20c30c3cad267f217e&from=tabbar&lr=157',
      ], },
    {
      'name': 'M.Video-Eldorado',
      'description':
      'Крупнейшая розничная сеть электроники и бытовой техники в России.',
      'images': [
        'https://yandex.by/images/search?text=eldorado+%D0%BE%D1%84%D0%B8%D1%81&pos=0&rpt=simage&img_url=https%3A%2F%2Fic.pics.livejournal.com%2Ftanya_shakhnes%2F26283219%2F2104472%2F2104472_original.jpg&from=tabbar&lr=157',
      ], },
    {
      'name': 'Softline',
      'description':
      'IT-компания, предоставляющая решения для цифровой трансформации бизнеса.',
      'images': [
        'https://yandex.by/images/search?text=softline+%D0%BE%D1%84%D0%B8%D1%81&pos=0&rpt=simage&img_url=http%3A%2F%2Fhabrastorage.org%2Fgetpro%2Fhabr%2Fpost_images%2F5ab%2F1c7%2F548%2F5ab1c7548207b16557720edd60a43eaf.jpg&from=tabbar&lr=157',
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