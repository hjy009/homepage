package com.cxic.service.impl;

import com.cxic.service.impl.GenericManagerImpl;
import com.cxic.dao.GenericDao;
import com.cxic.model.Person;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;
 
import static org.junit.Assert.assertSame;
import static org.mockito.BDDMockito.*;

public class PersonManagerImplTest extends BaseManagerMockTestCase {
	 
    @InjectMocks
    private GenericManagerImpl<Person, Long>  personManager;
 
    @Autowired
    public void setPersonManager(GenericManagerImpl<Person, Long> personManager) {
        this.personManager = personManager;
    }
    
    @Mock
    private GenericDao<Person, Long> personDao;
 
	@Autowired
	public void setPersonDao(GenericDao<Person, Long> personDao) {
	    this.personDao = personDao;
	}

	@Test
    public void testGetPerson() {
        log.debug("testing get...");
        //given
        final Long id = 7L;
        final Person person = new Person();
        given(personDao.get(id)).willReturn(person);
        //when
        Person result = personManager.get(id);
        //then
        assertSame(person, result);
    }
 
    @Test
    public void testGetPersons() {
        log.debug("testing getAll...");
        //given
        final List persons = new ArrayList();
        given(personDao.getAll()).willReturn(persons);
        //when
        List result = personManager.getAll();
        //then
        assertSame(persons, result);
    }
 
    @Test
    public void testSavePerson() {
        log.debug("testing save...");
        //given
        final Person person = new Person();
        // enter all required fields
         
        given(personDao.save(person)).willReturn(person);
        //when
        personManager.save(person);
        //then
        verify(personDao).save(person);
    }
    @Test
    public void testRemovePerson() {
        log.debug("testing remove...");
        //given
        final Long id = -11L;
        willDoNothing().given(personDao).remove(id);
        //when
        personManager.remove(id);
        //then
        verify(personDao).remove(id);
    }

}
