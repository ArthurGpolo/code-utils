"use client";

/*
    Página exemplo para listar as dados
        • Listar os dados (OK)
        • Ao selecionar uma dado, direcionar para a página do dado selecionado (OK)
*/

import { useState, useEffect } from 'react';

export default function Exemplo() {

    /* Definir o useState */
    const [exemplos, setExemplos] = useState([]);

    /* Definir o useEffect */
    useEffect(() => {
        async function carregarExemplos() {
            try {
                const resposta = await fetch('http://localhost:3000/{completar com a rota desejada}');
                const data = await resposta.json();

                if (data.sucesso) {
                    setExemplos(data.dados.exemplos);
                } else {
                    console.log(data.mensagem);
                }
            } catch (err) {
                console.error('Erro ao carregar equipes:', err);
            }
        }

        carregarExemplos();
    }, []);

    return (<>

        {/* Exemplo funcional de map() com redirecionamento a item selecionado */}
        {exemplos.length === 0 ? (
            <p>Carregando exemplos...</p>
        ) : (
            exemplos.map((exemplo, index) => (
                exemplo.id > 0 &&
                <div
                    key={exemplo.id}
                    onClick={() => window.location.href = `/{rota desejada}/${exemplo.id}`}
                    style={{ '--i': index }}
                >
                    <p className='card-text'>{exemplo.dado}</p>
                </div>

            ))
        )}

    </>);
}