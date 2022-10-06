import React from 'react'
import './about.css';
import {TbCertificate} from 'react-icons/tb';
import {GiSpellBook} from 'react-icons/gi';
import {FaPeopleArrows} from 'react-icons/fa';
import image from './../Images/about.jpg';

const About = () => {
  return (
    <div className='about_home'>
                    <div className='image'>
                      <img src={image} alt='About_load_image'/>
                    </div>
                    <div className='About_home_content'>
                                        <div className='about_heading'>
                                                           <h4>LEARN ANYTHING</h4>
                                                            <h2>Benefits About Online Learning Expertise</h2>
                                        </div>
                                    <article>
                                        <div className='icon'>
                                                           
                                                            <GiSpellBook className='icons'/>
                                        </div>
                                        <div className='text'>
                                                            <h3>Online Course</h3>
                                                            <p>Far far away behind the word mountains. Far from the countries
                                                              hyderabad and hala their live the behind tests.
                                                            </p>
                                        </div>
                                    </article>

                                    <article>
                                        <div className='icon'>
                                        <TbCertificate className='icons'/>
                                        </div>
                                        <div className='text'>
                                                            <h3>Earn A Certificate</h3>
                                                            <p>Far far away behind the word mountains. Far from the countries
                                                              hyderabad and hala their live the behind tests.
                                                            </p>
                                        </div>
                                    </article>

                                    <article>
                                        <div className='icon'>
                                                            <FaPeopleArrows className='icons'/>
                                        </div>
                                        <div className='text'>
                                                            <h3>Learn with Expert</h3>
                                                            <p>Far far away behind the word mountains. Far from the countries
                                                              hyderabad and hala their live the behind tests.
                                                            </p>
                                        </div>
                                    </article>



                    </div>
    </div>
  )
}

export default About