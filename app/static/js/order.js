let sc = document.getElementById("shopping_cart")
let keys = shoppingKeys()

let order = {}
let fullOrder = {}
let total = 0
let totalstr = ""
let tg = window.Telegram.WebApp;

keys.forEach((key) => {
    let amount = localStorage.getItem(key);
    let name, ord, price;
    [name, ord, price, codeType] = key.split("//").slice(1);

    if (!(name in order)) {
        order[name] = {}
    }
    order[name][ord] = amount

    if (!(name in fullOrder)) {
        fullOrder[name] = {}
        fullOrder[name]["ord"] = {}
    }
    if (!(ord in fullOrder[name]["ord"])) {
        fullOrder[name]["ord"][ord] = {}
    }
    fullOrder[name]["ord"][ord]["amount"] = amount
    fullOrder[name]["ord"][ord]["price"] = price
    fullOrder[name]["codeType"] = codeType

    total += (parseFloat(price) * parseInt(amount))
    totalstr = prettify(parseFloat(total.toFixed(2)), " ", ".")
})

function prettify (num, separator, floatSeparator) {
    var n = num.toString();
    if (floatSeparator) {
        n = n.replace(".", floatSeparator);
    }
    return n.replace(/(\d{1,3}(?=(?:\d\d\d)+(?!\d)))/g, "$1" + separator);
}

Object.keys(order).forEach((name) => {
    let d = document.createElement("div")
    d.classList.add("order-item")

    let h = document.createElement("h6")
    h.textContent = name
    d.appendChild(h)
    d.appendChild(createTable(fullOrder, name))
    sc.appendChild(d)
})

function createTable(order, name) {
    let t = document.createElement("table")
    t.classList.add("table")
    t.innerHTML = `
    <thead>
        <tr>
            <th scope="col">${order[name]["codeType"]}</th>
            <th scope="col">Цена, руб</th>
            <th scope="col">Кол-во</th>
        </tr>
    </thead>
    <tbody>
    </tbody>
    ` 

    rows = []
    Object.keys(order[name]["ord"]).forEach((ord) => {
        product = order[name]["ord"][ord]
        rows.push([ord, product["price"], product["amount"]])
    })
    rows.sort(function(a, b) { return a[1] - b[1] })

    body = t.getElementsByTagName("tbody")[0]
    rows.forEach((product) => {
        body.appendChild(createRow(product[0], product[1], product[2]))
    })
    return t
}

function createRow(ord, price, amount) {
    let r = document.createElement("tr")

    let th = document.createElement("th")
    th.scope = "row"
    th.textContent = ord
    r.appendChild(th)

    let td1 = document.createElement("td")
    td1.classList.add("price")
    td1.textContent = price
    r.appendChild(td1)

    let td2 = document.createElement("td")
    td2.textContent = amount
    r.appendChild(td2)
    return r
}

function check_order(order) {
    if (Object.keys(order).length > 0) {
        return 'visible'
    } else {
        return 'hidden'
    }
}

document.getElementsByTagName("h6")[1].textContent = `${totalstr} руб.`
document.getElementById("modal-order").style.visibility = check_order(order)
document.getElementById("btn-clear").style.visibility = check_order(order)
document.getElementById("new_order").addEventListener("click", () => {

    if (document.getElementById("shipping-date").checkValidity()) {
        order["params"] = {
            "shipping_date": document.getElementById("shipping-date").value,
            "comment": document.getElementById("comment").value,
        }

        clear()

        fetch('/order/new', {
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(order)
        })
        .then(response => {
            let d = document.createElement("div")
            d.style.textAlign = "center"
            d.style.margin = "20%"

            let h = document.createElement("h5")
            h.style.display = "inline"

            let s = document.createElement("span")
            s.style.fontSize = "30px"
            s.style.display = "inline"

            if (response.ok) {
                h.textContent = "Заказ сформирован успешно"
                s.textContent = "\u2714"
                s.style.color = "green"
            } else {
                h.textContent = "Упс... Произошла ошибка. Обратитесь к менеджеру по номеру: +7 (495) 783-50-55"
                s.textContent = "\u2718"
                s.style.color = "red"
            }
            d.appendChild(s)
            d.appendChild(h)
            sc.appendChild(d)
            return response.json()
        })
        .then(response => {
            if (response["status"] != "success") {
                console.log(JSON.stringify(response))
            }
        })
        .catch((error) => {
             console.log(error)
        })
        document.getElementsByClassName("btn-close")[0].click()
        tg.sendData(JSON.stringify(order))
    }
    else {
        document.getElementById("shipping-date").style.borderColor="red"
    }
})

document.getElementById("btn-clear").addEventListener("click", clear)

function clear() {
    keys.forEach((key) => localStorage.removeItem(key));
    document.getElementById("order-smth").style.display = 'none';
    document.getElementById("order").style.display = 'none';
    document.getElementById("btn-clear").style.display = 'none';
    sc.innerHTML = "";
}

function shoppingKeys() {
    let keys = []
    for (let i = 0; i < localStorage.length; i++) {
        let key = localStorage.key(i);
        if (key.includes("order")) {
            keys.push(key)
        }
    }
    return keys
}
