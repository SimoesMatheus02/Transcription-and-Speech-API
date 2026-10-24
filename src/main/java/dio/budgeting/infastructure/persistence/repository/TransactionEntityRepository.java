package dio.budgeting.infastructure.persistence.repository;

import dio.budgeting.domain.Category;
import dio.budgeting.infastructure.persistence.entity.TransactionEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.UUID;

public interface TransactionEntityRepository extends CrudRepository<TransactionEntity, UUID>{
    List<TransactionEntity> findAllByCategory(Category category);

}
