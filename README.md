# XMLParser

Generic XML Parser that returns a parsed JSON-like object structure

# From XML to Json to Object Structure ?

## A. One element

### XML version
	<?xml version="1.0" encoding="UTF-8" ?>
	<contact></contact>
### JSON version
	{
		"contact" : {}
	}
### Discussion
An element is always first considered a dictionary.

## B. One element with attributes

### XML version
	<?xml version="1.0" encoding="UTF-8" ?>
	<contact identifier="0"></contact>
### JSON version
	{
		"contact" : {
			"identifier" : 0
		}
	}
### Discussion
When an element has attributes they are considered objects of the element's dictionary, with their name as the object's key.

## C. One element with attributes and datas

### XML version
	<?xml version="1.0" encoding="UTF-8" ?>
	<contact identifier="0">
		Some string datas
	</contact>
### JSON version
	{
		"contact" : {
			"identifier" : 0,
			"content" : "Some string datas"
		}
	}
### Discussion
When an element contains a string or a CDATA, it is considered an object of the element's dictionary, with "content" as the object's key.

## D. Multiple elements

### XML version
	<?xml version="1.0" encoding="UTF-8" ?>
	<contact identifier="0">
		<firstname>Zouhair</firstname>
	</contact>
### JSON version
	{
		"contact" : {
			"identifier" : 0,
			"firstname" : {
				"content" : "Zouhair"
			}
		}
	}
### Discussion
When an element contains a subelement, the subelement is considered an object of the element's dictionary, with its name as the object's key. The object representing the element is, as seen before, first considered a dictionary.

## E. Array of elements (virtual)

### XML version
	<?xml version="1.0" encoding="UTF-8" ?>
	<contact identifier="0">
		<firstname>Zouhair</firstname>
		<phone type="mobile">+3362345678</phone>
		<phone type="home">+3312345678</phone>
	</contact>
### JSON version
	{
		"contact" : {
			"identifier" : 0,
			"firstname" : {
				"content" : "Zouhair"
			}
			"phonesArray" : [
				{
					"type" : "mobile",
					"content" : "+3362345678"
				},
				{
					"type" : "home",
					"content" : "+3312345678"
				}
			]
		}
	}
### Discussion
When an element contains multiple subelements with the same name, they are put together in their order of appearance in an array. This array is considered an object of the element's dictionary, with the construction "[SUBELEMENTNAME]sArray" as its name.

## F. Array of elements (xml described)

### XML version
	<?xml version="1.0" encoding="UTF-8" ?>
		<phones>
			<phone type="mobile">+3362345678</phone>
			<phone type="home">+3312345678</phone>
		</phones>
### JSON version
	{	"
		"phones" : [
			{
				"type" : "mobile",
				"content" : "+3362345678"
			},
			{
				"type" : "home",
				"content" : "+3312345678"
			}
		]
	}
### Discussion
In this example, the element only contains one type of subelement. If this happens, we want to avoid having a useless level like this :

	{
		"phones" : {
			"phonesArray" : [
				{
					"type" : "mobile",
					"content" : "+3362345678"
				},
				{
					"type" : "home",
					"content" : "+3312345678"
				}
			]
		}
	}

When the `phones`dictionary only contains one object, the array, we remove the auto-generated array and replace the `phones`dictionary with a `phones` array.