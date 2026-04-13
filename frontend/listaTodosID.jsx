'use client';

/*
    Página exemplo para listar as dados
        • Listar os dados (OK)
        • Ao selecionar uma dado, direcionar para a página do dado selecionado (OK)
    Esse arquivo deve estar em uma pasta chamada [id] entre coxetes
*/

import { useState, useEffect } from 'react';
import { useParams } from 'next/navigation';
import CardExemplo from '@/components/CardTimes/Card';


export default function Times() {

    // Definir parâmetro para id
	const { id } = useParams()

    // Definir useState
	const [exemplos, setExemplos] = useState(null);
	const [exemploAdmin, setExemploAdmin] = useState([])
	const [exeemploFuncionario, setExemploFuncionario] = useState([])

	/* Carregando a exemplo */
	useEffect(() => {
		async function carregarExemplo() {
			try {
				const resposta = await fetch(`http://localhost:3000/api/{deifinir rota}/${id}`);
				const data = await resposta.json();

				if (data.sucesso) {
					setExemplos(data.dados.exemplos);
				} else {
					console.log(data.mensagem);
				}
			} catch (err) {
				console.error('Erro ao carregar equipe:', err);
			}
		}

		carregarExemplo();
	}, []);

	/* Carregando exemplo funcionário */
	useEffect(() => {
		async function carregarExemploFuncionario() {
			try {
				if (!exemplos) return;
				
				const resposta = await fetch(`http://localhost:3000/api/{rota desejada}/${exemplos.id}/funcionario`);
				const data = await resposta.json();

				if (data.sucesso) {
					console.log(data);
					setExemploAdmin(data.dados.exemploAdmin);
					setExemploFuncionario(data.dados.exeemploFuncionario);
				} else {
					console.log(data.mensagem);
				}
			} catch (err) {
				console.error('Erro ao carregar membros:', err);
			}
		}

		carregarExemploFuncionario();
	}, [exemplos]);


	if (!exemplos) {
		return <p className='text-muted mt-5 text-center'>Carregando exemplos...</p>;
	}
	return (
		<div className='container py-5'>
			
			{/* Listando os exemplos admin */}
			<div className='d-flex flex-wrap justify-content-center mt-4 gap-3'>
				<div className='col-12 text-secondary text-center fs-5'>Exemplo admin</div>
				{
					exemploAdmin.map((adm, index) => <div key={adm.id} className='animacao' style={{ '--i': index }} >
					     <CardExemplo key={adm.id} pessoa={adm} /> {/* pessoa igual propriedade que difere eles */}
					</div>
					)
				}
			</div>

			{/* Listando os exemplos funcionarios */}
			<div className='d-flex flex-wrap justify-content-center mt-4 gap-3'>
				<div className='col-12 text-secondary text-center fs-5'>Exemplo funcionario</div>
				{
					exeemploFuncionario.map((func, index) => <div key={func.id} className='animacao' style={{ '--i': index }} >
						<CardExemplo pessoa={func} /> {/* pessoa igual propriedade que difere eles */}
					</div>
					)
				}
			</div>

		</div>
	);
}