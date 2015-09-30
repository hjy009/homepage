package com.cxic.dao;

import org.appfuse.dao.BaseDaoTestCase;

import com.cxic.model.Person;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;

import java.util.List;

import static org.junit.Assert.*;

public class PersonDaoTest extends BaseDaoTestCase {
	private GenericDao<Person, Long> personDao;

	@Autowired
	public void setPersonDao(GenericDao<Person, Long> personDao) {
	    this.personDao = personDao;
	}

	@Test(expected = DataAccessException.class)
	public void testAddAndRemovePerson() throws Exception {
		Person person = new Person();
		person.setFirstName("Country");
		person.setLastName("Bry");

		person = personDao.save(person);
		flush();

		person = personDao.get(person.getId());

		assertEquals("Country", person.getFirstName());
		assertNotNull(person.getId());

		log.debug("removing person...");

		personDao.remove(person.getId());
		flush();

		// should throw DataAccessException
		personDao.get(person.getId());
	}
}