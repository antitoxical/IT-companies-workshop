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
      'id': '2',
      'name': 'Mail.ru Group',
      'description':
      'Одна из крупнейших IT-компаний России, владеющая почтовыми сервисами, соцсетями и игровыми проектами.',
      'images': [
        'https://yandex.by/images/search?text=mail+ru&pos=23&isize=small&rpt=simage&img_url=https%3A%2F%2Fstatic.tildacdn.com%2Ftild3363-6537-4333-b636-616131366330%2FCopy_of_lacrimosaass.png&from=tabbar&iorient=square&lr=157',
        'https://yandex.by/images/search?text=mail+ru+%D1%84%D0%BE%D1%82%D0%BE+%D0%BE%D1%84%D0%B8%D1%81%D0%B0&pos=12&rpt=simage&img_url=https%3A%2F%2Fmedia.rbcdn.ru%2Fmedia%2Fnews%2Fmailru-groupoffice-13.jpg&from=tabbar&lr=157',
        'https://yandex.by/images/search?text=mail+ru+%D1%84%D0%BE%D1%82%D0%BE+%D0%BE%D1%84%D0%B8%D1%81%D0%B0&pos=20&rpt=simage&img_url=http%3A%2F%2Fi.pinimg.com%2Foriginals%2F7e%2F85%2F4c%2F7e854c3337c2dff15e8f85ff47abc55f.jpg&from=tabbar&lr=157',
        'https://yandex.by/images/search?text=mail+ru+%D1%84%D0%BE%D1%82%D0%BE+%D0%BE%D1%84%D0%B8%D1%81%D0%B0&pos=27&rpt=simage&img_url=https%3A%2F%2Fwww.signbusiness.ru%2Fupload%2Fresize_cache%2Fiblock%2Fff1%2F800_800_1%2FIMG_20190821_215103.jpg&from=tabbar&lr=157',
        'https://yandex.by/images/search?p=1&text=mail+ru+%D1%84%D0%BE%D1%82%D0%BE+%D0%BE%D1%84%D0%B8%D1%81%D0%B0&pos=5&rpt=simage&img_url=https%3A%2F%2Fsun9-20.userapi.com%2FGK1ozIrKnOuForHwGZjhCqgc5gZCEZCnf-VI4w%2F2vhbfBIt6N4.jpg&from=tabbar&lr=157',
        'https://yandex.by/images/search?p=2&text=mail+ru+%D1%84%D0%BE%D1%82%D0%BE+%D0%BE%D1%84%D0%B8%D1%81%D0%B0&pos=5&rpt=simage&img_url=https%3A%2F%2F1prime.ru%2Fimages%2F83240%2F81%2F832408180.jpg&from=tabbar&lr=157',
        'https://yandex.by/images/search?p=2&text=mail+ru+%D1%84%D0%BE%D1%82%D0%BE+%D0%BE%D1%84%D0%B8%D1%81%D0%B0&pos=14&rpt=simage&img_url=https%3A%2F%2Fincrussia.ru%2Fwp-content%2Fuploads%2F2020%2F01%2FTASS_32000013-1.jpg&from=tabbar&lr=157',
      ],
    },
    {
      'id': '3',
      'name': 'Kaspersky Lab',
      'description':
      'Международная компания, специализирующаяся на разработке антивирусного ПО и кибербезопасности.',
      'images': [
        'https://yandex.by/images/search?text=kaspersky+logo&pos=3&isize=small&rpt=simage&img_url=https%3A%2F%2Fpapik.pro%2Fuploads%2Fposts%2F2022-01%2F1643636204_14-papik-pro-p-kasperskii-logotip-17.png&from=tabbar&lr=157&iorient=square',
      ],
    },
    {
      'id': '4',
      'name': 'ABBYY',
      'description':
      'Компания, занимающаяся разработкой решений для обработки текста и анализа данных.',
      'images': [
        'https://yandex.by/images/search?text=%D1%84%D0%B8%D0%B8%D0%BD%D0%BD&pos=2&isize=small&rpt=simage&img_url=https%3A%2F%2Fstatic.ict.moscow%2Ffiles%2Fproductcard%2Flogo%2F43007709_2297722763574379_1425452134614171648_n%2520%25282%2529_0.png&from=tabbar&iorient=square&lr=157',
      ],
    },
    {
      'id': '5',
      'name': '1С',
      'description':
      'Компания, разрабатывающая программное обеспечение для бухгалтерии и бизнеса.',
      'images': [
        'https://yandex.by/images/search?text=1%D1%81&pos=4&isize=small&rpt=simage&img_url=https%3A%2F%2Fthechronicle.ru%2Fwp-content%2Fuploads%2Ff%2Ff%2Fd%2Fffdba42780d9b75089a2c3a656bae368.png&from=tabbar&lr=157&iorient=square',
      ],
    },
    {
      'id': '6',
      'name': 'Тинькофф (Tinkoff)',
      'description':
      'Финтех-компания, предоставляющая банковские и инвестиционные услуги через цифровые платформы.',
      'images': [
        'https://yandex.by/images/search?text=%D1%82%D0%B8%D0%BD%D1%8C%D0%BA%D0%BE%D1%84%D1%84&pos=7&isize=small&rpt=simage&img_url=https%3A%2F%2Fsun9-38.userapi.com%2Fimpg%2FZX6CGl8uaANMW9Km_4wXxbmNWM_DNTBNYD8DLQ%2F1UPNPTMDvFc.jpg%3Fsize%3D1080x558%26quality%3D96%26sign%3D42e2a8d0d992c26b3aa4900518b738a4%26c_uniq_tag%3DAlt1Xlp6mQPUJdCfHyCqUVK5xPz2b52uPbbYm39amvs%26type%3Dalbum&from=tabbar&lr=157&iorient=square',
      ],
    },
    {
      'id': '7',
      'name': 'Сбер (Sber)',
      'description':
      'Крупнейший банк России, активно развивающий IT-направление и экосистему цифровых сервисов.',
      'images': [
        'https://yandex.by/images/search?text=%D1%81%D0%B1%D0%B5%D1%80&pos=17&isize=small&rpt=simage&img_url=https%3A%2F%2Fstatic.tildacdn.com%2Ftild6632-6430-4066-b661-643863376162%2F_.png&from=tabbar&iorient=square&lr=157',
      ],
    },
    {
      'id': '8',
      'name': 'Ростелеком (Rostelecom)',
      'description':
      'Ведущий телекоммуникационный оператор России, предоставляющий услуги связи и IT-решения.',
      'images': [
        'https://yandex.by/images/search?text=%D1%80%D0%BE%D1%81%D1%82%D0%B5%D0%BB%D0%B5%D0%BA%D0%BE%D0%BC&pos=0&isize=small&rpt=simage&img_url=https%3A%2F%2Fxn--80aaacvakkq6ab9ayef.xn--p1ai%2Fschoolbook%2Ftextbook%2Fmodule_6%2Frostelecom.png&from=tabbar&lr=157&iorient=square',
      ],
    },
    {
      'id': '9',
      'name': 'CESCA',
      'description':
      'Компания-разработчик и ИТ‑интегратор систем, программно-аппаратных комплексов и уникальных решений, представленный на рынке ИТ‑услуг.',
      'images': [
        'https://yandex.by/images/search?text=cesca+&pos=23&isize=small&rpt=simage&img_url=https%3A%2F%2Fstatic.tildacdn.com%2Ftild6435-3535-4661-a333-333130613230%2F4.png&from=tabbar&lr=157&iorient=square',
      ],
    },
    {
      'id': '10',
      'name': 'Positive Technologies',
      'description':
      'Компания, специализирующаяся на защите информационных систем и предотвращении кибератак.',

      'images': [
      'https://yandex.by/images/search?text=positive+technologies+%D0%BE%D1%84%D0%B8%D1%81&pos=5&isize=small&rpt=simage&img_url=https%3A%2F%2Fcisoclub.ru%2F_ipx%2Ff_webp%2Cq_99%2Fwp-content%2Fuploads%2F2021-11-17_18-38-39-640x357.jpg&from=tabbar&lr=157&iorient=square',
      ],},
    {
      'id': '11',
      'name': 'Acronis',
      'description':
      'Разработчик решений для резервного копирования и киберзащиты данных.',
      'images': [
        'https://yandex.by/images/search?text=acronis+%D0%BE%D1%84%D0%B8%D1%81&pos=2&isize=small&rpt=simage&img_url=https%3A%2F%2Fchannellife.com.au%2Fuploads%2Fstory%2F2018%2F03%2F06%2Fcompatible_Screen_Shot_2018-03-05_at_11.jpg&from=tabbar&lr=157&iorient=square',
      ], },
    {
      'id': '12',
      'name': 'Parallels',
      'description':
      'Компания, создающая программное обеспечение для виртуализации и управления серверами.',
      'images': [
        'https://yandex.by/images/search?text=parallels+%D0%BE%D1%84%D0%B8%D1%81&pos=4&isize=small&rpt=simage&img_url=https%3A%2F%2Ffastly.4sqi.net%2Fimg%2Fgeneral%2F200x200%2F9VemgIfUdz2bEc0O1G1uvYUZ2rmCZ6c85tszAHVNMTw.jpg&from=tabbar&lr=157&iorient=square',
      ],  },
    {
      'id': '13',
      'name': 'JetBrains',
      'description':
      'Разработчик инструментов для программистов, таких как IntelliJ IDEA и PyCharm.',
      'images': [
        'https://yandex.by/images/search?text=jetbrains+%D0%BE%D1%84%D0%B8%D1%81&pos=15&isize=small&rpt=simage&img_url=https%3A%2F%2Fdom.com.cy%2Fupload%2Fiblock%2Fe7d%2Fe7d186c8ee1525dedb597e0998d47f97.jpg&from=tabbar&lr=157&iorient=square',
      ],  },
    {
      'id': '14',
      'name': 'VK (ранее ВКонтакте)',
      'description':
      'Социальная сеть и экосистема цифровых сервисов, включая музыку, игры и образование.',
      'images': [
      'https://yandex.by/images/search?text=%D0%B2%D0%BA&pos=36&isize=small&rpt=simage&img_url=https%3A%2F%2Ffiles.redbasset.tech%2Fredbasset%2Fepisode_cover%2F365%2F761%2F27558%2F1653388739734_fbeac3eb_dda2_494e_8ccd_4e1544b4a9f2.jpg&from=tabbar&lr=157&iorient=square',
      ],  },
    {
      'id': '15',
      'name': 'Ozon',
      'description':
      'Российский онлайн-ритейлер, предоставляющий широкий ассортимент товаров.',
      'images': [
        'https://yandex.by/images/search?text=ozon+%D0%BE%D1%84%D0%B8%D1%81&pos=8&isize=small&rpt=simage&img_url=https%3A%2F%2Fi8.photo.2gis.com%2Fimages%2Fbranch%2F0%2F30258560095322064_465a.jpg&from=tabbar&lr=157&iorient=square',
      ], },
    {
      'id': '16',
      'name': 'Wildberries',
      'description':
      'Крупнейшая маркетплейс-платформа в России, специализирующаяся на продаже одежды и товаров.',
      'images': [
        'https://yandex.by/images/search?p=2&text=wildberries+%D0%BE%D1%84%D0%B8%D1%81&pos=19&isize=small&rpt=simage&img_url=https%3A%2F%2Fthumbs.dreamstime.com%2Fb%2Fshop-sign-wildberries-international-online-store-clothes-shoes-shop-wildberries-international-online-store-228212477.jpg&from=tabbar&lr=157&iorient=square',
      ], },
    {
      'id': '17',
      'name': 'Xsolla',
      'description':
      'Компания, предоставляющая платежные решения для игровой индустрии.',
      'images': [
        'https://yandex.by/images/search?text=xsolla+%D0%BE%D1%84%D0%B8%D1%81&pos=2&isize=small&rpt=simage&img_url=https%3A%2F%2Fv-kurse.ru%2Fwp-content%2Fuploads%2F2021%2F10%2Forigin.jpg&from=tabbar&lr=157&iorient=square',
      ], },
    {
      'id': '18',
      'name': 'QIWI',
      'description':
      'Финтех-компания, предоставляющая платежные и финансовые сервисы.',
      'images': [
      'https://yandex.by/images/search?text=qiwi+%D0%BE%D1%84%D0%B8%D1%81&pos=1&isize=small&rpt=simage&img_url=http%3A%2F%2Fnefakt.info%2Fwp-content%2Fuploads%2F2016%2F07%2Fqiwi-i-skrill-ustranili-vse-narushenija_1.jpg&from=tabbar&lr=157&iorient=square',
      ], },
    {
      'id': '19',
      'name': 'M.Video-Eldorado',
      'description':
      'Крупнейшая розничная сеть электроники и бытовой техники в России.',
      'images': [
        'https://yandex.by/images/search?text=mvideo+%D0%BE%D1%84%D0%B8%D1%81&pos=11&isize=small&rpt=simage&img_url=https%3A%2F%2Fsun9-29.userapi.com%2Fimpg%2FeaXvB5L0xmGvLQOlCEbR2Og-nsCy-AqgmTWTVA%2FPkFzkFbfaUM.jpg%3Fsize%3D933x634%26quality%3D95%26sign%3Db58c9c23309fda1f7b9139984b6d3f49%26c_uniq_tag%3DQKRF2v1zxwt2exQPv1v3_94yC7ynGLa9XmQsIo16t8w%26type%3Dalbum&from=tabbar&lr=157&iorient=square',
      ], },
    {
      'id': '20',
      'name': 'Softline',
      'description':
      'IT-компания, предоставляющая решения для цифровой трансформации бизнеса.',
      'images': [
      'https://yandex.by/images/search?text=softline+%D0%BE%D1%84%D0%B8%D1%81&pos=14&isize=small&rpt=simage&img_url=https%3A%2F%2Favatars.dzeninfra.ru%2Fget-zen_doc%2F108343%2Fpub_64ecde348aa4fd1f15b93812_64ece170138a636fbbb3c82e%2Fscale_1200&from=tabbar&lr=157&iorient=square',
      ], },
    {
      'id': '21',
      'name': 'EPAM Systems',
      'description':
      'Одна из крупнейших IT-компаний Беларуси, предоставляющая услуги по разработке программного обеспечения и консалтингу.',
      'images': [
        'https://yandex.by/images/search?text=epam+systems&pos=1&isize=small&rpt=simage&img_url=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F7%2F7b%2FEPAM_logo.svg%2F1200px-EPAM_logo.svg.png&from=tabbar&lr=157&iorient=square',
      ],
    },
    {
      'id': '22',
      'name': 'Wargaming',
      'description':
      'Компания, специализирующаяся на разработке многопользовательских онлайн-игр, таких как World of Tanks.',
      'images': [
        'https://yandex.by/images/search?text=wargaming&pos=1&isize=small&rpt=simage&img_url=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F8%2F8b%2FWargaming.net_logo.svg%2F1200px-Wargaming.net_logo.svg.png&from=tabbar&lr=157&iorient=square',
      ],
    },
    {
      'id': '23',
      'name': 'Viber Media',
      'description':
      'Компания, разработавшая популярное приложение для обмена сообщениями и звонков Viber.',
      'images': [
        'https://yandex.by/images/search?text=viber&pos=1&isize=small&rpt=simage&img_url=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F7%2F7b%2FViber_logo.svg%2F1200px-Viber_logo.svg.png&from=tabbar&lr=157&iorient=square',
      ],
    },
    {
      'id': '24',
      'name': 'BelHard',
      'description':
      'Группа компаний, предоставляющая IT-услуги, включая разработку программного обеспечения и аутсорсинг.',
      'images': [
        'https://yandex.by/images/search?text=belhard&pos=1&isize=small&rpt=simage&img_url=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F8%2F8b%2FBelHard_logo.svg%2F1200px-BelHard_logo.svg.png&from=tabbar&lr=157&iorient=square',
      ],
    },
    {
      'id': '25',
      'name': 'Itransition',
      'description':
      'Компания, предоставляющая услуги по разработке программного обеспечения, ИТ-консалтингу и аутсорсингу.',
      'images': [
        'https://yandex.by/images/search?text=itransition&pos=1&isize=small&rpt=simage&img_url=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F7%2F7b%2FItransition_logo.svg%2F1200px-Itransition_logo.svg.png&from=tabbar&lr=157&iorient=square',
      ],
    },
    {
      'id': '26',
      'name': 'Intetics',
      'description':
      'IT-компания, специализирующаяся на разработке программного обеспечения, тестировании и поддержке.',
      'images': [
        'https://yandex.by/images/search?text=intetics&pos=1&isize=small&rpt=simage&img_url=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F8%2F8b%2FIntetics_logo.svg%2F1200px-Intetics_logo.svg.png&from=tabbar&lr=157&iorient=square',
      ],
    },
    {
      'id': '27',
      'name': 'ScienceSoft',
      'description':
      'Компания, предоставляющая услуги по разработке программного обеспечения и ИТ-консалтингу.',
      'images': [
        'https://yandex.by/images/search?text=sciencesoft&pos=1&isize=small&rpt=simage&img_url=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F7%2F7b%2FScienceSoft_logo.svg%2F1200px-ScienceSoft_logo.svg.png&from=tabbar&lr=157&iorient=square',
      ],
    },
    {
      'id': '28',
      'name': 'SolbegSoft',
      'description':
      'Компания, занимающаяся разработкой программного обеспечения и предоставлением IT-услуг.',
      'images': [
        'https://yandex.by/images/search?text=solbegsoft&pos=1&isize=small&rpt=simage&img_url=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F8%2F8b%2FSolbegSoft_logo.svg%2F1200px-SolbegSoft_logo.svg.png&from=tabbar&lr=157&iorient=square',
      ],
    },
    {
      'id': '29',
      'name': 'Synesis',
      'description':
      'Компания, специализирующаяся на разработке решений для видеонаблюдения, аналитики и безопасности.',
      'images': [
        'https://yandex.by/images/search?text=synesis&pos=1&isize=small&rpt=simage&img_url=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F7%2F7b%2FSynesis_logo.svg%2F1200px-Synesis_logo.svg.png&from=tabbar&lr=157&iorient=square',
      ],
    },
    {
      'id': '30',
      'name': 'Gismart',
      'description':
      'Компания, разрабатывающая мобильные приложения и игры, такие как Cool Goal! и Cleon.',
      'images': [
        'https://yandex.by/images/search?text=gismart&pos=1&isize=small&rpt=simage&img_url=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F8%2F8b%2FGismart_logo.svg%2F1200px-Gismart_logo.svg.png&from=tabbar&lr=157&iorient=square',
      ],
    },
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