import React from 'react'
import './blog.css';
import {FaUserAlt} from 'react-icons/fa';
import {CgCalendarDates} from 'react-icons/cg';
import {TiMessages} from 'react-icons/ti';
import blog1 from './../Images/blog3.jpg';
import blog2 from './../Images/blog2.jpg';
import blog3 from './../Images/blog1.jpg';

const Blog = () => {
  return (
                    <div className='blog'>
                    <p>OUR COURSES</p>
                    <h2 className='blog_heading'>Explore Our Popular Online Courses</h2>
                    <div className='blog_course'>

                                        <article className='blog_article'>
                                                <div className='blog_image'>
                                                          <img src={blog3}/>
                                                </div>
                                            <div className='blog_text'>
                                              <div className='blog_menu'>
                                                <p> <FaUserAlt/>Admin</p>
                                                <p> <CgCalendarDates/>Jan 18,2022</p>
                                                <p> <TiMessages/>5 COMENTS</p>
                                              </div>
                                              <div className='blog_content'>
                                                <h2>Build your Dream Software/Engineering Career</h2>
                                                <p>The material used in this presentation i.e., pictures/graphs/text, etc. is 
                                                   solely intended for educational/teaching purpose, offered free of cost to 
                                                   the students for use under special
                                                   </p>
                                              </div>
                                            </div>
                                        </article>

                                        <article className='blog_article'>
                                                <div className='blog_image'>
                                                          <img src={blog1}/>
                                                </div>
                                            <div className='blog_text'>
                                              <div className='blog_menu'>
                                                <p> <FaUserAlt/>Admin</p>
                                                <p> <CgCalendarDates/>Apr 25,2022</p>
                                                <p> <TiMessages/>25 COMENTS</p>
                                              </div>
                                              <div className='blog_content'>
                                                <h2>Build your Dream Software/Engineering Career</h2>
                                                <p>The material used in this presentation i.e., pictures/graphs/text, etc. is 
                                                   solely intended for educational/teaching purpose, offered free of cost to 
                                                   the students for use under special
                                                   </p>
                                              </div>
                                            </div>
                                        </article>

                                        <article className='blog_article'>
                                                <div className='blog_image'>
                                                          <img src={blog2}/>
                                                </div>
                                            <div className='blog_text'>
                                              <div className='blog_menu'>
                                                <p> <FaUserAlt/>Admin</p>
                                                <p> <CgCalendarDates/>Feb 16,2022</p>
                                                <p> <TiMessages/>30 COMENTS</p>
                                              </div>
                                              <div className='blog_content'>
                                                <h2>Build your Dream Software/Engineering Career</h2>
                                                <p>The material used in this presentation i.e., pictures/graphs/text, etc. is 
                                                   solely intended for educational/teaching purpose, offered free of cost to 
                                                   the students for use under special
                                                   </p>
                                              </div>
                                            </div>
                                        </article>

                    </div>
    </div>
      
  )
}

export default Blog
