Създайте клас ImagesManager (singleton клас), който съдържа масив от картинки.
Модела на картинките ще бъде следния:  

```swift
class ImageModel { 
	let title: String  
	let upperText: String?
	let lowerText: String?
	let image: UIImage?  
}
```  

Добавете към Welcome екрана бутон, който push-ва `ImagesTableViewController` - наследник на `UITableViewController` в navigation controller-а, представляващ списък от картинки генерирани от потребителя.

Масива в `ImagesManager` ще използваме за източник на данни за таблицата в `ImagesTableViewController`.
В дясната страна на navigation bar-а на `ImagesTableViewController` добавете бутон (bar button item), който да отваря модално друг екран `InputViewController`, състоящ се от:  
- 3 text field-а подредени в stack view - Title, Upper text, Lower text.  
- Бутон отварящ галерията за избор на картинка.  
- Бутон, който запазва модел с попълнените данни в масива на `ImagesManager`.

Създайте UITableViewCell от тип `custom` и създайте подобаващ дизайн.
Да се имплементират методите на `UITableViewDataSource` и `UITableViewDelegate` в `ImagesTableViewController`.  
В подходящ момент от life cycle на `ImagesTableViewController` да се използва метода `reloadData()` на неговата таблица.
