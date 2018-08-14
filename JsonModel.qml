import QtQuick 2.0

Item {
    id: wrapper
    property string dataUrl
    signal isLoaded
    property variant model: dataList
    property int status: XMLHttpRequest.UNSENT
    property bool isLoading: status === XMLHttpRequest.LOADING
    property bool wasLoading: false
    ListModel { id: dataList }
    property variant objectArray
<<<<<<< Updated upstream
    property string searchTerm
=======
>>>>>>> Stashed changes

    Component.onCompleted: {
        console.log("Loading data " + dataUrl)
        dataList.clear()
        var req = new XMLHttpRequest;
        req.open("GET", dataUrl);
        req.onreadystatechange = function() {
            status = req.readyState;
            if (status === XMLHttpRequest.DONE) {
<<<<<<< Updated upstream
                //                console.log(req.responseText)
=======
//                console.log(req.responseText)
>>>>>>> Stashed changes
                objectArray = JSON.parse(req.responseText);
                if (objectArray.errors !== undefined)
                    console.log("Error fetching data: " + objectArray.errors[0].message)
                else {
                    for (var key in objectArray) {
                        var jsonObject = objectArray[key];
                        dataList.append(jsonObject);
                    }
                }
                if (wasLoading == true){
                    //                    console.log(dataList.rowCount())
                    console.log("Loaded data " + dataUrl)
                    wrapper.isLoaded()
                }
            }
            wasLoading = (status === XMLHttpRequest.LOADING);
        }
        req.send();
    }

    function insertItem(item) {
        dataList.insert(0, item)
        console.log("Send the item to Holochain here!")
    }

    function filter(filterFunction) {
        dataList.clear()
        var filteredObjectArray = objectArray.filter(filterFunction)
        for (var key in filteredObjectArray) {
            var jsonObject = filteredObjectArray[key];
            dataList.append(jsonObject);
        }
    }
}
