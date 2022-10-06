import React from 'react'
import './Home.css';
import {AiOutlineArrowRight} from 'react-icons/ai';
import Header from "./../Header/Header";
import Navbar from './../Navbar/Navbar';
const Home = () => {
  return (
  <section className='home'>
                    <Header/>
<Navbar/>

                    
                    <div className='container'>
                                        <div className='home_content'>
                                                    <h2>welcome to academia</h2>
                                                    <h1>Best Online Education Expertise</h1>
                                                    <p>For for away, behinds the words, mountains far from the countries
                                                            Pakistan and Iran. there live the blind tests</p>        
                                               <div className='buttons'>
                                                            <button className='btn1'>Get Started Now <AiOutlineArrowRight/></button>
                                                            <button className='btn2'>View Course <AiOutlineArrowRight/></button>
                                               </div>
                                        </div>
                                        
                    </div>
  </section>
                    )
}

export default Home