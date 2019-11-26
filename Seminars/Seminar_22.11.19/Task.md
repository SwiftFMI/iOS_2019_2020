# Използвайки UITableViewController, създайте семпло приложение за имени дни:

В табличен вид да се показват данните от модела `NameDay`.

[Линк към лекцията](https://github.com/SwiftFMI/iOS_2019_2020/blob/master/lectures/Lecture%208%20-%20UITableView/UITableView.md)

### 1. Използвайки наследник UITableViewController с прототипни клетки и UITableViewCell със стил `basic`, покажете датите на всички имени дни от модела.
Използвайте масива `NameDaysDataSource.shared.nameDays`

### 2. Променете стилът на клетката от задача 1 на `subtitle` и показвайте заглавието и датата на имените дни от модела.
Редовете в таблицата трябва да са с динамични височини и всички текстове да са изцяло видими (без многоточия или изрязване).

### 3. Използвайки `custom` клетка, визуализирайте всички данни от модела (заглавие, дата, имена). 
Използвайте *Autolayout* и *UIStackView* и UILabel с неограничен брой редове (numberOfLines - 0). Имената трябва да са разделени със запетая и ляво подравнени.
![](custom-cell.jpeg)

### 4. Добавете нов екран, показващ детайлите за даден имен ден при селекция на ред от таблицата (дизайнът е без значение).
Изчиствайте селекцията в `didSelect` функцията.
Упражнете предаването на информация от един екран към друг (`prepare(for segue: UIStoryboardSegue, 
sender: Any?)` и знанията от предните две лекции). Екранът трябва да се показва чрез "push" навигация, използвайки UINavigationController.
(Бонус) използвайте `@IBSegueAction` за инициализацията на екрана с детайлите вместо `prepare` метода и implicitly unwrapped optionals - `var nameDay: NameDay!`

### 5. Добавете модално-презентиран екран "Персонализация", представляващ таблица със статични клетки, хедър и футър. 
Секцията да е със заглавие "Напомняния", а статичните клетки да са "Включване" (`custom` клетка с текст от ляво и UISwitch отдясно) и "Час" (`right detail` клетка с текст от ляво(заглавие) и час от дясно(детайли)).
Футърът да има текст "Включване и изключване на напомнянията и настройка на часа".
![](settings.jpeg)

### 6. (Бонус) Направете датите на всички имени дни в таблицата "sticky headers"
Докато е видим ред, изобразяващ имен ден, датата да "плува" над него за по-голяма видимост. 
Премахнете датата от самата клетка.

### 7. (Бонус) Добавете функционалност за търсене на име, дата или заглавие на имен ден. Визуализирайте резултатите в същата таблица.
Използвайте UISearchController. 
Възползвайте се от вградената функционалност и `UISearchResultsUpdating` протокола.

Подсказка:
> let searchController = UISearchController(searchResultsController: nil)

> navigationItem.searchController = searchController

> definesPresentationContext = true