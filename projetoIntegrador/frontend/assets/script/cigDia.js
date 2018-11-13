var respfetch

async function corDosDias() {
    var d = $('#calendar').fullCalendar('getDate')
    var sendDate = `${d.year()}-${d.month() + 1}-01`
    let teste = await fetch('http://127.0.0.1/projetoIntegrador/backend/usuario/qtdfumada.php', {
        method: "POST",
        body: JSON.stringify(sendDate)
    })
    
    let resp = await teste.json()
    
    console.log(resp)

    respfetch = resp
    
    resp.result.forEach(dia => {
        dia.data = dia.data.substring(0, 10)
        let container = document.querySelector('[data-date="' + dia.data + '"]')
        let media = parseInt(resp.media)
        let qtd = parseInt(dia.qtd)
        let pct = qtd * 100 / media
        if (pct == 0) {
            container.style.backgroundColor = '34FF20'
            container.style.justifyContent = "center";
            container.innerHTML = qtd;
        } else if (pct > 0 && pct <= 10) {
            container.style.backgroundColor = '#03a63c'
            container.innerHTML = qtd;
        } else if (pct > 10 && pct <= 20) {
            container.style.backgroundColor = '#ffff9d'
            container.innerHTML = qtd;
        } else if (pct > 20 && pct <= 30) {
            container.style.backgroundColor = '#fad956'
            container.innerHTML = qtd;
        } else if (pct > 30 && pct <= 40) {
            container.style.backgroundColor = '#d9a404'
            container.innerHTML = qtd;
        } else if (pct > 40 && pct <= 50) {
            container.style.backgroundColor = '#f86d20'
            container.innerHTML = qtd;
        } else if (pct > 50 && pct <= 60) {
            container.style.backgroundColor = '#f2600c'
            container.innerHTML = qtd;
        } else if (pct > 60 && pct <= 70) {
            container.style.backgroundColor = '#f03107'
            container.innerHTML = qtd;
        } else if (pct > 70 && pct <= 80) {
            container.style.backgroundColor = '#c10202'
            container.innerHTML = qtd;
        } else if (pct > 80 && pct <= 90) {
            container.style.backgroundColor = '#730000'
            container.innerHTML = qtd;
            container.style.color = 'white'
        } else if (pct > 90 && pct <= 100) {
            container.style.backgroundColor = '#420000'
            container.innerHTML = qtd;
            container.style.color = 'white'
        } else if (pct >= 100) {
            container.style.backgroundColor = 'red'
            container.innerHTML = qtd;
            container.style.color = 'white'
        }

    })
}

$(document).ready(function () {
    var initialLocaleCode = 'pt-br';

    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next',
            center: 'title',
            right: 'month'
        },
        height: 450,
        defaultDate: '2018-11-02',
        locale: initialLocaleCode,
        buttonIcons: true, // show the prev/next text
        weekNumbers: false,
        navLinks: false, // can click day/week names to navigate views
        editable: true,
        eventLimit: true, // allow "more" link when too many events
    });

    // build the locale selector's options
    $.each($.fullCalendar.locales, function (localeCode) {
        $('#locale-selector').append(
            $('<option/>')
                .attr('value', localeCode)
                .prop('selected', localeCode == initialLocaleCode)
                .text(localeCode)
        );
    });
    // when the selected option changes, dynamically change the calendar option
    $('#locale-selector').on('change', function () {
        if (this.value) {
            $('#calendar').fullCalendar('option', 'locale', this.value);
        }
    });


    corDosDias()
});

let divResultadoEconomia = document.querySelector('.resultadoEconomia')
let economia = document.querySelector('.visivelEconomia')
economia.addEventListener('click', ev => {
    let quantidadeDias = parseInt(respfetch.result.length)
    let media = parseInt(respfetch.media)
    let aux = 0
    respfetch.result.forEach(dia => {
        let qtd = parseInt(dia.qtd)
        aux = aux + qtd
    })
    let qtdFumadaMes = parseInt(aux)
    console.log(qtdFumadaMes)
    let preco = parseInt(respfetch.preco)

    qtd = ((quantidadeDias * media) - qtdFumadaMes) * (preco / 20)
    
    let resposta = 'Voce economizou: ' + qtd + ' reais.'
    swal('Parabéns', resposta, 'info')
})
