Sen deneyimli bir **Flutter mobile app architect ve senior developer** olarak davran. Benim için **kapsamlı, modern, production-ready bir Pomodoro uygulaması** geliştirmeni istiyorum.

## Genel Amaç

Flutter kullanarak hem tasarım olarak şık, hem de mimari olarak temiz, sürdürülebilir, ölçeklenebilir bir **Pomodoro / odaklanma uygulaması** geliştir. Uygulama sadece basit bir timer olmasın; kullanıcıya gerçekten verimlilik sağlayan, kapsamlı özelliklere sahip bir uygulama olsun.

Ben kod yazmayacağım, projeyi sen geliştireceksin. Bu yüzden:

* Kararları mantıklı varsayımlarla sen al
* Gereksiz yere benden onay bekleme
* En iyi pratiklerle ilerle
* Her adımı düzenli ve profesyonel şekilde uygula
* Çalışan ve temiz kod üret
* Gerekirse eksik yerlerde mantıklı varsayımlar yap

## Teknik İstekler

* Framework: **Flutter**
* Dil: **Dart**
* Mimari: **Clean Architecture** veya en azından katmanlı, düzenli, ölçeklenebilir yapı
* State Management: **Riverpod** tercih ediyorum
* Local database: **Hive** veya **Isar** kullanabilirsin
* Bildirimler: local notifications
* Timer arka planda mantıklı şekilde çalışmalı
* Kod modüler, okunabilir ve yeniden kullanılabilir olsun
* Gerektiğinde service, repository, model, provider yapıları oluştur
* Null safety kullan
* Responsive tasarım yap
* Android öncelikli geliştir ama iOS uyumunu bozma
* MVVM benzeri düzenli yapı da kabul

## Uygulamanın Ana Özellikleri

Uygulama aşağıdaki modülleri içersin:

### 1. Pomodoro Timer Sistemi

* Çalışma süresi belirleme
* Kısa mola süresi belirleme
* Uzun mola süresi belirleme
* Kaç pomodoro sonrası uzun mola geleceğini ayarlama
* Start / Pause / Resume / Reset
* Sonraki moda otomatik geçiş seçeneği
* Seans bitince ses / titreşim / bildirim
* Timer devam ederken ekran güncel kalsın
* Circular progress veya modern animasyonlu timer arayüzü olsun

### 2. Görev Yönetimi

* Kullanıcı görev ekleyebilsin
* Görev düzenleme / silme
* Göreve açıklama ekleme
* Göreve etiket / kategori ekleme
* Görev için tahmini pomodoro sayısı belirleme
* Tamamlanan pomodoro sayısı görev bazlı takip edilsin
* Tamamlandı olarak işaretleme
* Günlük görev listesi gösterme

### 3. İstatistik ve Analiz

* Günlük odak süresi
* Haftalık odak süresi
* Aylık odak süresi
* Tamamlanan pomodoro sayısı
* En verimli gün
* Kategori bazlı çalışma dağılımı
* Grafikler ve kartlar ile istatistik ekranı
* Streak sistemi (arka arkaya verimli günler)
* Kullanıcıya küçük içgörüler ver:

  * “Bugün dünün üstündesin”
  * “Bu hafta 12 pomodoro tamamladın” gibi

### 4. Ayarlar

* Light / Dark theme
* Bildirim aç/kapat
* Ses aç/kapat
* Titreşim aç/kapat
* Otomatik başlatma seçenekleri
* Varsayılan timer sürelerini değiştirme
* Uygulama dil altyapısı uygun olsun
* Gerekirse tema renklerini ayarlama

### 5. Motivasyon ve Odak Deneyimi

* Seans başında motive edici kısa metin
* Seans sonu küçük başarı mesajları
* İsteğe bağlı odak modu ekranı
* İsteğe bağlı ambient sesler için altyapı bırak
* Kullanıcı deneyimi sakin, temiz ve motive edici olsun

### 6. Geçmiş Kayıtları

* Tamamlanan seans geçmişi
* Hangi gün ne kadar odaklandığını listeleme
* Hangi görev üzerinde çalışıldığını geçmişte görebilme
* Filtreleme: bugün / hafta / ay

## Ekranlar

Aşağıdaki ekranları tasarla ve uygula:

1. **Splash Screen**
2. **Home / Dashboard**

   * aktif timer
   * bugünkü görevler
   * günlük özet
3. **Pomodoro Timer Screen**
4. **Task Management Screen**
5. **Task Detail / Edit Screen**
6. **Statistics Screen**
7. **Session History Screen**
8. **Settings Screen**

## UI/UX Beklentileri

* Modern, sade, premium hissiyat veren tasarım
* Fazla karmaşık değil ama güçlü gözüksün
* Kart tabanlı modern yapı
* Yumuşak renk paleti
* Güzel tipografi
* Akıcı animasyonlar
* Floating action button mantıklı yerlerde kullanılabilir
* Bottom navigation veya uygun navigation yapısı kur
* Kullanıcı ilk girişte zorlanmasın
* Boş state ekranları estetik olsun
* Gerektiğinde onboarding ekleyebilirsin

## Veri Yapısı ve Mimari Beklentiler

Aşağıdaki gibi düzenli bir yapı kur:

* core
* features
* shared
* services
* models/entities
* repositories
* providers
* screens/pages
* widgets/components

Kod tabanı büyümeye uygun olsun. İleride şu özellikler rahatça eklenebilsin:

* kullanıcı hesabı
* cloud sync
* premium üyelik
* arkadaşlarla çalışma
* leaderboard
* focus music
* wearables entegrasyonu

Bu yüzden bugünden scalable düşün.

## Kod Kalitesi

* Gereksiz tekrar yapma
* Reusable widget’lar oluştur
* Anlamlı dosya isimleri kullan
* Gerektiğinde extension ve helper yapıları kur
* Her şey tek dosyada olmasın
* Kod temiz ve profesyonel olsun
* Gerekli yerlerde açıklayıcı yorumlar ekle ama abartma

## Paket Seçimi

Gerekli paketleri mantıklı şekilde seç. Örneğin:

* state management
* local db
* charts
* notifications
* animations
* audio/vibration
  Ama gereksiz paket kullanma. Seçtiğin paketleri neden kullandığını kısaca belirt.

## Çıktı Formatı

Projeyi geliştirirken şu sırayla ilerle:

### Aşama 1

Önce projenin:

* feature listesi
* mimari planı
* klasör yapısı
* kullanılacak paketler
* ekran listesi
* veri modelleri
* kullanıcı akışı

bunları net şekilde çıkar.

### Aşama 2

Sonra bana:

* klasör yapısını
* temel dosyaları
* pubspec bağımlılıklarını
* theme yapısını
* navigation yapısını
* ana app iskeletini

oluştur.

### Aşama 3

Daha sonra modül modül kodla:

* timer modülü
* task modülü
* statistics modülü
* history modülü
* settings modülü

### Aşama 4

Sonunda:

* eksiklerin listesi
* gelecekte eklenebilir özellikler
* test önerileri
* performans iyileştirme önerileri
* release hazırlığı checklist’i

oluştur.

## Önemli Notlar

* Bana yüzeysel demo uygulama verme
* Gerçekten kapsamlı, geliştirilebilir bir proje üret
* Tasarım ve kod kalitesi yüksek olsun
* Best practice uygula
* Hata ihtimali olan yerlerde güvenli yaklaşım seç
* Gerekirse placeholder verilerle başla ama yapı gerçekçi olsun
* “Daha sonra yapılır” deyip geçme; mümkün olduğunca temel çalışan sürümü oluştur
* Her modül tamamlandığında hangi dosyaları eklediğini belirt
* Çalışan bir MVP değil, güçlü bir temel istiyorum

## Bonus Özellikler

Uygun görürsen bunları da dahil et:

* alışkanlık takibi ile bağlantı
* odak puanı sistemi
* başarı rozetleri
* günlük hedef belirleme
* widget desteği için altyapı planı
* session templates
* özel çalışma profilleri (deep work, study, reading vb.)

Şimdi bu projeyi bir senior developer gibi planla ve uygulamaya başla. Önce mimari plan ve proje yapısını çıkar, ardından adım adım kod üret.
