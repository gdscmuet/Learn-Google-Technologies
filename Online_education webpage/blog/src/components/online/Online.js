import React from 'react';
import './online.css';
import {AiFillStar} from 'react-icons/ai';
import {FiRotateCw} from 'react-icons/fi';
import {MdDeveloperMode} from 'react-icons/md';
import me from './../Images/Me.jpeg';
const Online = () => {
  return (
    <div className='online'>
                    <p>OUR COURSES</p>
                    <h2 className='online_heading'>Explore Our Popular Online Courses</h2>
                    <div className='Online_course'>
                                        <article className='online_course_article'>
                                                <div className='heading_icon'>
                                                            <MdDeveloperMode className='online_icon'/>
                                                            <h2>Introduction to Software Engineering</h2>
                                                            </div>
                                                            <ul>
                                                              <li><AiFillStar/></li>
                                                              <li><AiFillStar/></li>
                                                              <li><AiFillStar/></li>
                                                              <li><AiFillStar/></li>
                                                              <li><AiFillStar/></li>
                                                              </ul>
                                                              <div className='instructor'>
                                                                <img src={me} alt='Instructor'/>
                                                                <h5>by M.K.S</h5>

                                                              </div>

                                                              <button>Explore More <FiRotateCw/></button>

                                        </article>

                                        <article className='online_course_article'>
                                                <div className='heading_icon'>
                                                            <MdDeveloperMode className='online_icon'/>
                                                            <h2>Introduction to Software Engineering</h2>
                                                            </div>
                                                            <ul>
                                                              <li><AiFillStar/></li>
                                                              <li><AiFillStar/></li>
                                                              <li><AiFillStar/></li>
                                                              <li><AiFillStar/></li>
                                                              <li><AiFillStar/></li>
                                                              </ul>
                                                              <div className='instructor'>
                                                                <img src={me} alt='Instructor'/>
                                                                <h5>by M.K.S</h5>

                                                              </div>

                                                              <button>Explore More <FiRotateCw/></button>

                                        </article>

                                        <article className='online_course_article'>
                                                <div className='heading_icon'>
                                                            <MdDeveloperMode className='online_icon'/>
                                                            <h2>Introduction to Software Engineering</h2>
                                                            </div>
                                                            <ul>
                                                              <li><AiFillStar/></li>
                                                              <li><AiFillStar/></li>
                                                              <li><AiFillStar/></li>
                                                              <li><AiFillStar/></li>
                                                              <li><AiFillStar/></li>
                                                              </ul>
                                                              <div className='instructor'>
                                                                <img src={me} alt='Instructor'/>
                                                                <h5>by M.K.S</h5>

                                                              </div>

                                                              <button>Explore More <FiRotateCw/></button>

                                        </article>
                    </div>
    </div>
  )
}

export default Online