function prettify (num, separator, floatSeparator) {
    var n = num.toString();
    if (floatSeparator) {
        n = n.replace(".", floatSeparator);
    }
    return n.replace(/(\d{1,3}(?=(?:\d\d\d)+(?!\d)))/g, "$1" + separator);
}

let nav = Array.from(document.getElementsByClassName("hr-nav-1")[0]
                             .getElementsByClassName("nav-item"))
let containers = Array.from(document.getElementsByClassName("container"))

nav.forEach((element) => {
    element.addEventListener("click", () => {
        displayNavigation(element)
    })
})

function displayNavigation(element) {
    let id = element.id.split("_").slice(0, -1).join("_")
    containers.forEach((container) => {
        if (container.id.includes(id)) {
            container.style.display = "block";
        } else {
            container.style.display = "none";
        }
    })

    nav.forEach((element) => element.style.color = "rgb(0, 0, 0)")
    element.style.color = "rgb(213, 49, 39)"
}

Array.from(document.getElementsByClassName("modal")).forEach((modal) => {
    let inputs = Array.from(modal.getElementsByTagName("input"));
    let total = modal.getElementsByTagName("h6")[0];
    let prices = Array.from(modal.getElementsByClassName("price"))
                                .map((p) => parseFloat(p.textContent));
    let name = modal.getElementsByClassName("modal-title")[0].textContent;
    let unit = modal.getElementsByClassName("count-header")[0].getAttribute("unit");
    let codeType = modal.getElementsByTagName("thead")[0]
                        .getElementsByTagName("th")[0]
                        .textContent

    Array.from(modal.getElementsByTagName("tr")).slice(1).forEach((r) => {
        let ord = r.children[0].textContent;
        let price = r.children[1].textContent;
        let label = `order//${name}//${ord}//${price}//${codeType}`

        let item = localStorage.getItem(label)
        if (!!item) {
            r.children[2].getElementsByTagName("input")[0].value = item
        }
    })
    updateTotal(total, inputs, prices, unit)

    inputs.forEach((input) => {
        input.addEventListener("change", () => updateTotal(total, inputs, prices, unit))
    })

    modal
        .getElementsByClassName("modal-footer")[0]
        .getElementsByTagName("button")[0]
        .addEventListener("click", () => {
            Array.from(modal.getElementsByTagName("tr")).slice(1).forEach((r) => {
                let ord = r.children[0].textContent;
                let price = r.children[1].textContent;
                let amount = r.children[2].getElementsByTagName("input")[0].value
                
                let label = `order//${name}//${ord}//${price}//${codeType}`
                if (parseInt(amount) > 0) {
                    localStorage.setItem(label, amount)
                } else if (!!localStorage.getItem(label)) {
                    localStorage.removeItem(label)
                }
            })
        });

    modal.getElementsByClassName("btn")[0].addEventListener("click", () => {
        modal.getElementsByClassName("btn-close")[0].click();
    })
})

function sum(inputs) {
    return inputs.reduce((a, b) => a + b, 0)
}

function calcCost(amounts, prices) {
    total = 0
    for (let i = 0; i < amounts.length; i++) {
        total += amounts[i] * prices[i]
    }
    return Math.round(total * 100) / 100
}

function updateTotal(total, inputs, prices, unit) {
    let parsedInputs = inputs.map((i) => {
        if (i.value === "") {
            return 0
        }
        return parseInt(i.value)
    })
    let total_str = prettify(calcCost(parsedInputs, prices), " ", ".")
    total.innerHTML = `Итого: ${sum(parsedInputs)} ${unit}, ${total_str} руб.`
}