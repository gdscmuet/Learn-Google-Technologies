import React from "react";
import './Team.css';
import client1 from './../Images/Me.jpeg';
import client2 from './../Images/Me.jpeg';
import client3 from './../Images/Me.jpeg';
// import imeg4 from '../../images/port4.png';
// import Swiper core and required modules
import { Pagination } from 'swiper';

import { Swiper, SwiperSlide } from 'swiper/react';

// Import Swiper styles
import 'swiper/css';
import 'swiper/css/pagination';

function Team(){
return (
<section id="team">
                      <p>TESTNOMIAL</p>
                    <h2 className='online_heading'>Our Successful Students</h2>
                    <Swiper className="container team-container"
                     // install Swiper modules
      modules={[ Pagination]}
      spaceBetween={40}
      slidesPerView={1}
     
      pagination={{ clickable: true }}
      >
                       <SwiperSlide className="team">
                            <div className="std_avatar">
                                        <img src={client2} alt=""/></div>
                                        <h5 className="std_name">Ali Haider</h5>
                                        <small className="std_review">
                                       Dear User i have good experience in muet and i passed my graduation degree in software
                                       engineering in 2024 and i hope i perfome good wiith my juniors in university.

                                        </small>
                            
                                        </SwiperSlide>    

                                        <SwiperSlide className="team">
                            <div className="std_avatar">
                                        <img src={client3} alt=""/></div>
                                        <h5 className="std_name">M Hussain</h5>
                                        <small className="std_review">
                                       Dear User i have good experience in muet and i passed my graduation degree in software
                                       engineering in 2024 and i hope i perfome good wiith my juniors in university.

                                        </small>
                            
                                        </SwiperSlide>    

                                        <SwiperSlide className="team">
                            <div className="std_avatar">
                                        <img src={client1} alt=""/></div>
                                        <h5 className="std_name">Aveen Kumar</h5>
                                        <small className="std_review">
                                       Dear User i have good experience in muet and i passed my graduation degree in software
                                       engineering in 2024 and i hope i perfome good wiith my juniors in university.

                                        </small>
                        
                                        </SwiperSlide>

                                        <SwiperSlide className="team">
                            <div className="std_avatar">
                                        <img src={client1} alt=""/></div>
                                        <h5 className="std_name">Khuram Raza</h5>
                                        <small className="std_review">
                                       Dear User i have good experience in muet and i passed my graduation degree in software
                                       engineering in 2024 and i hope i perfome good wiith my juniors in university.

                                        </small>
                        
                                        </SwiperSlide>

                                        <SwiperSlide className="team">
                            <div className="std_avatar">
                                        <img src={client1} alt=""/></div>
                                        <h5 className="std_name">Minhal Raza</h5>
                                        <small className="std_review">
                                       Dear User i have good experience in muet and i passed my graduation degree in software
                                       engineering in 2024 and i hope i perfome good wiith my juniors in university.

                                        </small>
                        
                                        </SwiperSlide>

                                        <SwiperSlide className="team">
                            <div className="std_avatar">
                                        <img src={client1} alt=""/></div>
                                        <h5 className="std_name">Zaki Abass</h5>
                                        <small className="std_review">
                                       Dear User i have good experience in muet and i passed my graduation degree in software
                                       engineering in 2024 and i hope i perfome good wiith my juniors in university.

                                        </small>
                        
                                        </SwiperSlide>    


                    </Swiper>
</section>
)

}

export default Team;