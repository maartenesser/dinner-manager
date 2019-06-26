import 'datatables.net'
import 'datatables.net-dt/css/jquery.dataTables.css'

const tables = () => {
  $(document).ready( function () {
      $('#members_table_id').DataTable({
        data: $('#members_table_id').data('table'),
        columns:
        [
          { data: 'first_name'},
          { data: 'last_name' },
          { data: "attending"},
          { data: 'guests' },
          {data: 'email'}
        ]
      });
  });
}

export default tables ;
